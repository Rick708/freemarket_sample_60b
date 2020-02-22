class Tell < ApplicationRecord
  belongs_to :user, optional: true
  validates :telephone ,presence: true
end
