class AddAdminIdToAlbums < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :admin_id, :integer
    add_index :albums, :admin_id
  end
end
