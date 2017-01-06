class AddRedirectLinkToHeader < ActiveRecord::Migration
  def change
    add_column :headers, :redirect_link, :text
  end
end
