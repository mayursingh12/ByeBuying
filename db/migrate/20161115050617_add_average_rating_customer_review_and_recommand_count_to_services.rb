class AddAverageRatingCustomerReviewAndRecommandCountToServices < ActiveRecord::Migration
  def change
    add_column :services, :average_rating, :float
    add_column :services, :customer_review, :integer
    add_column :services, :recommand_count, :integer
  end
end
