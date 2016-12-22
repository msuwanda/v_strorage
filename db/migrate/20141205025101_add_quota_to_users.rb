class AddQuotaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :quota, :string
  end
end
