class AddIsSaleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_sale, :boolean, default: false
    add_column :posts, :price, :intger, default: 0
  end
end
