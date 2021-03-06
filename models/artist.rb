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
      # Could also just say "RETURNING *" here
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

  def self.find_by_id(id)
    sql = "SELECT * FROM artists
      WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    artist_details = results[0]
    artist = Artist.new(artist_details)
    return artist
  end

  def update()
    sql = "UPDATE artists
      SET name = $1
      WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists
      WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def albums()
    sql = "SELECT * FROM albums
      WHERE artist_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    albums = results.map { |album| Album.new(album) }
    return albums
  end

end
