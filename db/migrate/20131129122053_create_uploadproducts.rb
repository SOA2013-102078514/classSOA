class CreateUploadproducts < ActiveRecord::Migration
  def change
    create_table :uploadproducts do |t|
	t.string :title
        t.string :categoryname
	t.integer :categorynum
	t.boolean :condition
	t.text :discription
	t.boolean :thingstodo
        t.references :user


      t.timestamps
    end
  end
end
