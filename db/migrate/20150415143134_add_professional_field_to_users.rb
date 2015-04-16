class AddProfessionalFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :professional_field, :string
    add_column :users, :homepage_url, :string
  end
end
