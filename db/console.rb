require_relative('../models/artist')
require_relative('../models/album')
require("pry-byebug")

artist1 = Artist.new({'name' => 'Captain Beefheart'})

album1 = Album.new({
  'title' => 'Trout Mask Replica',
  'genre' => 'Huh?',
  'artist_id' => artist1.id
  })

binding.pry
nil
