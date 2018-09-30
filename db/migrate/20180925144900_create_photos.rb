class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :tagline
      t.string :image
      t.integer :user_id
      t.integer :album_id
      t.string :slug

      t.timestamps null: false
    end
  end
end
