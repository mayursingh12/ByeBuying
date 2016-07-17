class City < ActiveRecord::Base

  belongs_to :state

  has_many :products

  has_many :services

end
