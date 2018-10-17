require_relative('../db/sql_runner')
require('pg')

class Album

  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
      VALUES ($1, $2, $3)
      RETURNING id;"
    values = [@title, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    results = SqlRunner.run(sql)
    albums = results.map { |album| Album.new(album) }
    return albums
  end

  def artist()
    sql = "SELECT * FROM artists
      WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_details = results[0]
    artist = Artist.new(artist_details)
    return artist
  end

end
