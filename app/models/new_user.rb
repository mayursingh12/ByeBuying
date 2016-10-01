class NewUser < ActiveRecord::Base


  validates :phone, length: { is: 10 }

end
