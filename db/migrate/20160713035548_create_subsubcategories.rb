class CreateSubsubcategories < ActiveRecord::Migration
  def change
    create_table :subsubcategories do |t|
      t.string :name
      t.integer :subcategory_id

      t.timestamps null: false
    end
  end
end
