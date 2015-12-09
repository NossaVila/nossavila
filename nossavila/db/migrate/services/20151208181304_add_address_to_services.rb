class AddAddressToServices < ActiveRecord::Migration
  def change
    add_column :services, :address, :string
  end
end
