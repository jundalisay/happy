json.songs do |json|
  json.array! @songs, partial: 'songs/song', as: :song
end