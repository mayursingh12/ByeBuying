class AdvertisementImage < ActiveRecord::Base

  belongs_to :advertisement

  DEFAULT_SIZE = :size_250x250

  has_attached_file :image, styles: { size_250x250: '250x250' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
