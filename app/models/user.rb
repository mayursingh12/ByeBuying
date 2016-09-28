class User < ActiveRecord::Base

  acts_as_paranoid

  has_many :advertisements

  has_many :products

  has_many :services

  has_many :enquiries

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :contact

  validates :contact, length: { is: 10 }


  def admin?
    self.type == 'Admin'
  end

  def customer?
    self.type == 'Customer'
  end

end
