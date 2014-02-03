## bu migration oluşturulurken;
## rails g migration AddOrderNumberToPosts order_number:string
## komutu ile oluşturuldu. 

class AddOrderNumberToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :order_number, :string  
    add_index :posts, :order_number
  end
end
