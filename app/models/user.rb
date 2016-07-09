class User < ActiveRecord::Base

  acts_as_paranoid

  has_many :advertisements

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.type == 'Admin'
  end

  def customer?
    self.type == 'Customer'
  end

end
