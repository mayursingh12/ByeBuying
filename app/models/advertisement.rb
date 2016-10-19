class Advertisement < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :subcategory, class_name: 'Subcategory', foreign_key: :subcategory_id
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  has_many :advertisement_images, dependent: :destroy

  # validates :title, presence: true
  # validates :description, presence: true
  # validates :start_at, presence: true
  # validates :end_at, presence: true
  # validates :per_hour_cost, presence: true
  # validates :category_id, presence: true
  # validates :subcategory_id, presence: true
  # validates :user_id, presence: true
  #
  # validate def end_date_after_start_date
  #   if self.start_at >= self.end_at
  #     self.errors.add(:end_at, 'must come after Start time')
  #   end
  # end

end
