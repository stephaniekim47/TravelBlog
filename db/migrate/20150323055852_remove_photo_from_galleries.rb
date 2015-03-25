class RemovePhotoFromGalleries < ActiveRecord::Migration
  def change
  	remove_column :galleries, :city_id, :integer
  	remove_column :galleries, :photo_file_name, :string
  	remove_column :galleries, :photo_content_type, :string
  	remove_column :galleries, :photo_file_size, :integer
  	remove_column :galleries, :photo_updated_at, :datetime
  end
end
