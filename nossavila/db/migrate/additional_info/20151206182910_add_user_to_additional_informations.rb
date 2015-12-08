class AddUserToAdditionalInformations < ActiveRecord::Migration
  def change
    add_reference :additional_informations, :user, index: true
  end
end
