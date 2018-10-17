require_relative('../models/artist')
require_relative('../models/album')
require("pry-byebug")

artist1 = Artist.new({'name' => 'Captain Beefheart'})
artist2 = Artist.new({'name' => 'Perfume Genius'})

artist1.save()
artist2.save()

artists_initial = Artist.all

album1 = Album.new({
  'title' => 'Trout Mask Replica',
  'genre' => 'Huh?',
  'artist_id' => artist1.id
  })
album2 = Album.new({
  'title' => 'Put Your Back N 2 It',
  'genre' => 'Singer-Songwriter',
  'artist_id' => artist2.id
  })

album1.save()
album2.save()

albums_initial = Album.all

binding.pry
nil
