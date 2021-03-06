class Illust < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :introduction, presence: true
  validates :image, presence: true

  def self.search(search)
    if search != ""
      Illust.where('introduction LIKE(?)', "%#{search}%")
    else
      Illust.all
    end
  end


end
