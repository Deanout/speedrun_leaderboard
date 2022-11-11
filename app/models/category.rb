class Category < ApplicationRecord
  validates_uniqueness_of :name
  has_one_attached :image, dependent: :destroy

  def thumbnail
    return image.variant(resize_to_limit: [200, 200]).processed if image.attached?
  end
end
