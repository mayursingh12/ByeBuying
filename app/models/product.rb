class Product < ActiveRecord::Base

  belongs_to :state

  belongs_to :city

  belongs_to :subcategory

  has_many :product_images, dependent: :destroy

  has_many :enquiries

  belongs_to :user, class_name: 'User', foreign_key: :user_id

  validates :category_id, presence: true
  validates :subcategory_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :state_id, presence: true
  validates :city_id, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :quantity, presence: true
  validates :rent, presence: true
  validates :price_in_rupees, presence: true

  validate def end_date_after_start_date
    if self.start_at >= self.end_at
      self.errors.add(:end_at, 'must come after Start time')
    end
  end

  validate def gender_for_wed
    return false unless self.category_id.present?
    category_id = self.category_id
    if Category.find(category_id).name == 'Wedding Collection' && self.gender.blank?
      self.errors.add(:gender, 'choose gender')
    end
  end

end
