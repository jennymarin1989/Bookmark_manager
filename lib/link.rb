require 'pg'
require 'uri'
require './lib/database_connection'

class Link

  def initialize(id, url)
    @id = id
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
  end

  def self.add_new_link(new_link)
    raise "You must submit a valid URL." unless working_link?(new_link)
    DatabaseConnection.query("INSERT INTO links(url) VALUES('#{new_link}')")
  end

  private

  def self.working_link?(new_link)
    new_link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
