class AddAttributesToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :name, :string
    add_column :profiles, :photo, :attachment
  end
end
