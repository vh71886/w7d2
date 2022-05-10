class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer, :band_id
      t.integer, :year
      t.string, :title
      t.boolean :studio

      t.timestamps
    end
  end
end
