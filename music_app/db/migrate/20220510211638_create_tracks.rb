class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.string :title
      t.integer :ord
      t.text :lyrics
      t.boolean :bonus

      t.timestamps
    end
  end
end
