class Enquiry < ActiveRecord::Base

  belongs_to :product
  belongs_to :service
  belongs_to :user

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :user_id, presence: true
  validates :status, presence: true
  # validates :is_product, presence: true

  STATUS_ENQUIRY = 'Enquiry'

  STATUS_QUOTED = 'Quoted'

  STATUS_CONFIRMED = 'Confirmed'

  STATUSES = [STATUS_ENQUIRY, STATUS_QUOTED, STATUS_CONFIRMED]


  validate def require_product
    if self.is_product? and self.product_id.blank?
      self.errors.add(:product_id, "product can't blank")
    end
  end

  validate def require_service
    if !self.is_product? and self.service_id.blank?
      self.errors.add(:service_id, "service can't blank")
    end
  end

  validate def product_start_date
    if self.is_product? and (self.start_at <DateTime.now  or self.start_at >= self.end_at) #self.product.start_at
      self.errors.add(:start_at, "must be between current time & end time ")
    end
  end

  validate def service_start_date
    if !self.is_product? and (self.start_at < DateTime.now or self.start_at >= self.end_at) and self.service.subcategory.category.name == 'Membership' #self.service.start_at
      self.errors.add(:start_at, "must be between current time & end time ")
    end
  end

  validate def product_end_date
    if self.is_product? and (self.end_at > self.product.end_at or self.end_at <DateTime.now  ) #self.start_at
      self.errors.add(:end_at, "must be between current time & end time ")
    end
  end

  validate def service_end_date
    if !self.is_product? and (self.end_at > self.service.end_at or self.end_at <DateTime.now  ) and self.service.subcategory.category.name == 'Membership' #self.start_at
      self.errors.add(:end_at, "must be between current time & end time ")
    end
  end


  validate def product_quanity
    if self.is_product?

      quantity = product.quantity


      self.errors.add(:start_at, "must be between current time & end time ")
    end
  end

end
