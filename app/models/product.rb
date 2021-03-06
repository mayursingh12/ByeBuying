class Product < ActiveRecord::Base

  belongs_to :state

  belongs_to :city

  belongs_to :subcategory

  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  has_many :enquiries

  belongs_to :user, class_name: 'User', foreign_key: :user_id

  has_many :ratings, as: :rateable

  validates :category_id, presence: true
  validates :subcategory_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :state_id, presence: true
  validates :city_id, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :quantity, presence: true
  # validates :rent, presence: true
  # validates :price_in_rupees, presence: true
  validates :per_hour_price, presence: true
  validates :per_day_price, presence: true
  validates :per_week_price, presence: true
  validates :per_month_price, presence: true

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

  # validate def product_end_date
  #   if self.end_at > self.product.end_at or self.end_at <DateTime.now  #self.start_at
  #     self.errors.add(:end_at, "must be between current time & end time ")
  #   end
  # end

end
