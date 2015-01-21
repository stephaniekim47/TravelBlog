class AddUserRefToCountries < ActiveRecord::Migration
  def change
    add_reference :countries, :user, index: true
    add_foreign_key :countries, :users
  end
end
