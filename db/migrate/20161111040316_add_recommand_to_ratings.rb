class AddRecommandToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :recommand, :boolean
  end
end
