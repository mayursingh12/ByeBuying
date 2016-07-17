class ProductImage < ActiveRecord::Base

  belongs_to :product

  DEFAULT_SIZE = :size_250x250

  has_attached_file :image, styles: { size_250x250: '250x250' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :image, presence: true

end
