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

  def self.delete_link(title)
    p title_exists?(title)
    raise "This link doesn't exist" unless title_exists?(title)
    DatabaseConnection.query("DELETE FROM links WHERE title = '#{title}'")
  end

  def self.update_link(title, new_title, new_url)
    DatabaseConnection.query("UPDATE links SET title = '#{new_title}', url ='#{new_url}' WHERE title = '#{title}'")
  end

  private

  def self.working_link?(new_link)
    new_link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end

   def self.title_exists?(title) #=== params[title]
     result = DatabaseConnection.query("SELECT * FROM links")
      result.map{|link| link['title']}.include?(title)
   end

end
