class Piyocomic < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
end
