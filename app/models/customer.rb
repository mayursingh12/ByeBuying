class Customer < User

  attr_accessor :password_confirmation

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  # validates_confirmation_of :password

  # validate def password_and_confirm_password
  #   if self.password.present? and self.password_confirmation.present? and self.password == self.confirm_password
  #     true
  #   else
  #     self.errors.add(:password, 'password not matched')
  #   end
  # end

end