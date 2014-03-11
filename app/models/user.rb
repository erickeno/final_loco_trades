class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  validates :first_name, presence: true
  validates :last_name,  presence: true

  validates :username,   :uniqueness => { :case_sensitive => false }

  has_many :posts, dependent: :destroy

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
end
