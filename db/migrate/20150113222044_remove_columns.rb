class RemoveColumns < ActiveRecord::Migration
  def change
  end

  def self.up
  	remove_column :countries, :text
  end
end
