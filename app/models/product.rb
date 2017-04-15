class Product < ApplicationRecord
  has_many :line_items
  before_destroy :check_no_line_items

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true, length: {
    minimum: 10,
    too_short: 'should have at least 10 characters'
  }
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\Z/i,
    message: 'must be GIF, JPG or PNG.'
  }

  private

  # ensure that there are no line items referencing this product
  def check_no_line_items
    return true if line_items.empty?
    errors.add(:base, 'Line Items present')
    false
  end
end