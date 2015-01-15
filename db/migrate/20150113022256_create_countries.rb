class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :text
      t.string :title
      t.attachment :photo

      t.timestamps null: false
    end
  end
end
