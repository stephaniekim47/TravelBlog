class AddCityRefToGalleries < ActiveRecord::Migration
  def change
  	add_reference :galleries, :city, index: true
  	add_foreign_key :galleries, :city
  end
end
