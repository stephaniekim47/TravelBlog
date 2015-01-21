class AddUserRefToCities < ActiveRecord::Migration
  def change
    add_reference :cities, :user, index: true
    add_foreign_key :cities, :users
  end
end
