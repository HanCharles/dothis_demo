class AddSaleDetailToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :sale_detail, :text
  end
end
