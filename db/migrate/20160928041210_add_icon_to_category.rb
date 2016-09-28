class AddIconToCategory < ActiveRecord::Migration
  def change
    add_attachment :categories, :icon_image
    add_attachment :categories, :detail_image
  end
end
