class Rating < ActiveRecord::Base

  belongs_to :rateable, polymorphic: true

  validates :number, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

end
