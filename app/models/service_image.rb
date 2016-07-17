class ServiceImage < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :service

  DEFAULT_SIZE = :size_250x250

  has_attached_file :image, styles: { size_250x250: '250x250' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :image, presence: true
end
