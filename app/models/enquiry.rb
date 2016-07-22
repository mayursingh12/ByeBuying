class Enquiry < ActiveRecord::Base

  belongs_to :product
  belongs_to :service
  belongs_to :user

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :user_id, presence: true
  validates :status, presence: true
  validates :is_product, presence: true

  validate def require_product
    if self.is_product and self.product_id.blank?
      self.errors.add(:product_id, "product can't blank")
    end
  end

  # validate def require_service
  #   unless self.is_product and self.service_id.blank?
  #     self.errors.add(:service_id, "service can't blank")
  #   end
  # end

  validate def start_date
    if self.is_product and (self.start_at < self.product.start_at or self.start_at >= self.end_at)
      self.errors.add(:start_at, "must be between start & end time ")
    end
  end

  validate def end_date
    if self.is_product and (self.end_at > self.product.end_at or self.end_at < self.start_at )
      self.errors.add(:end_at, "must be between start & end time ")
    end
  end
  #
  # validate def start_date_for_service
  #   if !self.is_product and self.service.present? and self.start_at >= self.service.start_at
  #     self.errors.add(:start_at, "must be between start & end time ")
  #   end
  # end
  #
  # validate def end_date_for_service
  #   if !self.is_product and self.service.present? and self.end_at >= self.service.end_at
  #     self.errors.add(:end_at, "must be between start & end time ")
  #   end
  # end


end
