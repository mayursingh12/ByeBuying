class Service < ActiveRecord::Base

  belongs_to :state

  belongs_to :city

  belongs_to :subcategory

  has_many :service_images, dependent: :destroy

  has_many :enquiries

  belongs_to :user, class_name: 'User', foreign_key: :user_id

  validates :category_id, presence: true
  validates :subcategory_id, presence: true
  validates :service_description, presence: true
  validates :state_id, presence: true
  validates :city_id, presence: true
  validates :price_type, presence: true
  validates :price_in_rupees, presence: true

  validate def gender_for_wed
    return false unless self.category_id.present?
    category_name = Category.find(self.category_id).name
    if category_name == 'Wedding Collection' && self.gender.blank?
      self.errors.add(:gender, 'choose gender')
    end
  end


  validate def club_name_for_membership
    return false unless self.category_id.present?
    category_name = Category.find(self.category_id).name
    if category_name == 'Membership' && self.club_name.blank?
      self.errors.add(:club_name, "can't blank")
    end
  end

  validate def membership_plan_for_membership
    return false unless self.category_id.present?
    category_name = Category.find(self.category_id).name
    if category_name == 'Membership' && self.membership_plan.blank?
      self.errors.add(:membership_plan, "can't blank")
    end
  end

  validate def start_at_for_membership
    return false unless self.category_id.present?
    category_name = Category.find(self.category_id).name
    if category_name == 'Membership' && self.start_at.blank?
      self.errors.add(:membership_plan, "can't blank")
    end
  end

  validate def end_at_for_membership
    return false unless self.category_id.present?
    category_name = Category.find(self.category_id).name
    if category_name == 'Membership' && self.end_at.blank?
      self.errors.add(:membership_plan, "can't blank")
    end
  end

  validate def start_at_end_at_for_membership
    return false unless self.category_id.present?
    category_name = Category.find(self.category_id).name
    if category_name == 'Membership' && self.start_at.present? && self.end_at.present? && self.start_at >= self.end_at
      self.errors.add(:end_at, 'must come after Start time')
    end
  end

  validate def area_in_meters_for_commercial_space
    return false unless self.category_id.present?
    category_name = Category.find(self.category_id).name
    if category_name == 'Commercial Space' && self.area_in_meters.blank?
      self.errors.add(:area_in_meters, "can't blank")
    end
  end

  validate def amenities_available_for_commercial_space
    return false unless self.category_id.present?
    category_name = Category.find(self.category_id).name
    if category_name == 'Commercial Space' && self.amenities_available.blank?
      self.errors.add(:amenities_available, "can't blank")
    end
  end

  end
