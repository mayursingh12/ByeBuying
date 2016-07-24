class ProductImage < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :product

  DEFAULT_SIZE = :size_500x500

  has_attached_file :image, styles: { size_500x500: '500x500!' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
