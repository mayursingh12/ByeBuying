class State < ActiveRecord::Base

  has_many :cities, dependent: :destroy

  has_many :products, dependent: :destroy

  has_many :services, dependent: :destroy

end
