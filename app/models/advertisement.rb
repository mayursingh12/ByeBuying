class Advertisement < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :subcategory, class_name: 'Subcategory', foreign_key: :subcategory_id

  has_many :advertisement_images, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :per_hour_cost, presence: true
  validates :contact, presence: true
  validates :email, presence: true
  validates :category_id, presence: true
  validates :subcategory_id, presence: true

end
