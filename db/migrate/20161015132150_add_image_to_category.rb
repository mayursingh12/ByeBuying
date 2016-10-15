class AddImageToCategory < ActiveRecord::Migration
  def change
    add_attachment :categories, :interior_image
  end
end
