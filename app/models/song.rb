class Song < ApplicationRecord
  belongs_to :genre
  belongs_to :artist
  
  include PgSearch
    pg_search_scope :search, against: [:title, :album, :song_id], 
      using: {tsearch: {dictionary: "english"}}

end