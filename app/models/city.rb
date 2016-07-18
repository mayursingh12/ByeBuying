class City < ActiveRecord::Base

  belongs_to :state

  has_many :products, dependent: :destroy

  has_many :services, dependent: :destroy

end
