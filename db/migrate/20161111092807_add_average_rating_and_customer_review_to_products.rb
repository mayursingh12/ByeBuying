class AddAverageRatingAndCustomerReviewToProducts < ActiveRecord::Migration
  def change
    add_column :products, :average_rating, :float
    add_column :products, :customer_review, :integer
  end
end
