class RemoveCitiesFromGalleries < ActiveRecord::Migration
  def change
    remove_column :galleries, :cities_id, :integer
  end
end
