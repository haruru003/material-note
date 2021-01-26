class Content < ApplicationRecord

  belongs_to :user, optional: true
  has_one_attached :image

  
  validates :title, presence: true
  validates :image, presence: true
end

