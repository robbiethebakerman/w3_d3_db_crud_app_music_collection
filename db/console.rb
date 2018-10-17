require_relative('../models/artist')
require_relative('../models/album')
require("pry-byebug")

Album.delete_all
Artist.delete_all

artist1 = Artist.new({'name' => 'Captain Beefheart'})
artist2 = Artist.new({'name' => 'Perfume Genius'})
artist3 = Artist.new({'name' => 'Florence and the Machine'})

artist1.save()
artist2.save()
artist3.save()

artists = Artist.all

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
album3 = Album.new({
  'title' => 'Too Bright',
  'genre' => 'Pop',
  'artist_id' => artist2.id
  })

album1.save()
album2.save()
album3.save()

albums = Album.all

artist1_albums = artist1.albums()
artist2_albums = artist2.albums()

artist_album1 = album1.artist
artist_album2 = album2.artist

artist1.name = 'The Captain'
artist1.update

album1.genre = 'No-one knows'
album1.update

# artist3.delete
#
# album2.delete

found_artist = Artist.find_by_id(artist3.id)

found_album = Album.find_by_id(album1.id)

binding.pry
nil
