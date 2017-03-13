class AddAdminToChefs < ActiveRecord::Migration[5.0]
  def change #admin will have full access inc edit other users and deleting
    add_column :chefs, :admin, :boolean, default: false
  end
end
