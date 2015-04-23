class AddSaleUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :sale_url, :string
  end
end
