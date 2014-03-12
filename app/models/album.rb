class Album < ActiveRecord::Base
  belongs_to :post

  validates :image, presence: true
  validates :post_id, presence: true

  mount_uploader :image, ImageUploader
end
