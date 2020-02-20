class Image < ApplicationRecord
# assosiation
  mount_uploader :image, ImageUploader
  belongs_to :item

# validation
  validates :image, presence: true
end
