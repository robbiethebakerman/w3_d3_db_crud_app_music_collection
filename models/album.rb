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

end
