class AddAttributesToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :ip_address, :string
    add_column :locations, :text_address, :string
    add_column :locations, :street, :string
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :country, :string
  end
end
