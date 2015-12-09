class AddUserToServices < ActiveRecord::Migration
  def change
    add_reference :services, :user, index: true
  end
end
