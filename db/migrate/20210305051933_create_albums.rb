class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :discription
      t.boolean :published

      t.timestamps
    end
  end
end
