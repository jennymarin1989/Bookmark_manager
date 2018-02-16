require 'pg'
require 'uri'
require './lib/database_connection'

class Link

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
      p result.map { |link| Link.new(link['id'], link['url'], link['title'])  }
      # result.each do |row|
      # p "#{Link.new} %s %s" % [ row['id'], row['url'] ]
  end

  def self.add_new_link(new_link, title)
    raise "You must submit a valid URL." unless working_link?(new_link)
    DatabaseConnection.query("INSERT INTO links(url, title) VALUES('#{new_link}','#{title}')")
  end

  private

  def self.working_link?(new_link)
    new_link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
