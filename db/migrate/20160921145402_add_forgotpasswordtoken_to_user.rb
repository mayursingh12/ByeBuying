class AddForgotpasswordtokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :forgot_token, :string
  end
end
