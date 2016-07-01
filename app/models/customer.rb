class Customer < User

  attr_accessor :password_confirmation

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

end