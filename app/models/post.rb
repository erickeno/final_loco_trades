class Post < ActiveRecord::Base
	
	belongs_to :user
	has_many :albums, dependent: :destroy
	accepts_nested_attributes_for :albums
	has_many :comments, :as => :commentable, dependent: :destroy

	default_scope -> { order('created_at DESC') }

	validates :user_id,   presence: true 
end
