class NewUser < ActiveRecord::Base


  validates :contact, length: { is: 10 }

end
