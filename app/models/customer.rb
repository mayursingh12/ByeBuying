class Customer < User

  attr_accessor :password_confirmation

  validates :name, presence: true
  validates :email, presence: true
  validates :contact, presence: true

  validates :password, presence: true, on: :create
  validates :password,presence: false, on: :update, allow_blank: true

  has_attached_file :image, styles: {size_500x500: '500x500!'}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


end