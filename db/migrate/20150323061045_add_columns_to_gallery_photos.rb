class AddColumnsToGalleryPhotos < ActiveRecord::Migration
  def change
  	  add_reference :gallery_photos, :gallery, index: true
      add_foreign_key :gallery_photos, :gallery
      add_column :gallery_photos, :photo_file_name,    :string
      add_column :gallery_photos, :photo_content_type, :string
      add_column :gallery_photos, :photo_file_size,    :integer
      add_column :gallery_photos, :photo_updated_at,   :datetime
  end
end
