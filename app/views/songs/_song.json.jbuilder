json.(song, :song_id, :title, :genre, :artist_id, :album, :link, :photo)
json.artist song.artist, partial: 'artists/artist', as: :artist