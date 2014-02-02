class RemoveOrderNumberToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :order_number, :string
  end
end
