class RemoveDaniToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :dani, :string
  end
end
