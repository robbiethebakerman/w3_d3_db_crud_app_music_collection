require_relative('../db/sql_runner')
require("pg")

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
      VALUES ($1)
      RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    results = SqlRunner.run(sql)
    artists = results.map { |artist| Artist.new(artist) }
    return artists
  end

  def update()
    sql = "UPDATE artists
      SET name = $1
      WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def albums()
    sql = "SELECT * FROM albums
      WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    albums = results.map { |album| Album.new(album) }
    return albums
  end

end
