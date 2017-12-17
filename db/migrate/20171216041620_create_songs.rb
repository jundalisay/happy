class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|

      t.references :genre, index: true, foreign_key: true
      t.references :artist, index: true, foreign_key: true
      t.integer   :song_id
      
      t.string   :title
      t.string   :album
      t.string   :link
      t.string  :photo


      t.timestamps
    end
  end
end
