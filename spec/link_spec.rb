require 'link'

describe Link do

  describe '#all' do
    it 'returns all the links' do
      links = Link.all
      url = links.map(&:url)
      expect(url).to include("http://www.makersacademy.com")
      expect(url).to include("http://www.facebook.com")
      expect(url).to include("http://www.google.com")
    end
  end
  describe '.add_new_link' do
    it 'add new link to the end of bookmark list' do
      Link.add_new_link('http://www.testlink.com', 'testlink')
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include 'http://www.testlink.com'
    end
    it "doesn't create a new link if URL is not valid" do
      links = Link.all
      urls = links.map(&:url)
      expect(urls).not_to include "You must submit a valid URL."
    end
  end

  describe '.delete_link' do
    it "deletes the link if it already exists " do
      Link.delete_link('google')
      links = Link.all
      titles = links.map(&:title)
      expect(titles).not_to include 'google'
    end
  end

end
