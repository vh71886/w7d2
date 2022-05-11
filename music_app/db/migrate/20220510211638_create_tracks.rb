class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false, unique: true
      t.string :title, null: false
      t.integer :ord, null: false, unique: true
      t.text :lyrics
      t.boolean :bonus, null: false, default: false

      t.timestamps
    end
    add_index :tracks, :album_id
    add_index :tracks, [:album_id, :title], unique: true

  end
end
