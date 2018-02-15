require 'pg'
require 'uri'
require './lib/database_connection'

class Link
  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def self.add_new_link(new_link)
    return false unless working_link?(new_link)
    DatabaseConnection.query("INSERT INTO links(url) VALUES('#{new_link}')")
  end

  private

  def self.working_link?(new_link)
     new_link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
