class AddStateCodeToState < ActiveRecord::Migration
  def change
    add_column :states, :code, :string
  end
end
