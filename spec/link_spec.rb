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

  describe "./update_link" do
    it "updates the link with a new link and title" do
      Link.update_link('google', 'tweeter', 'http://www.tweeter.com')
      links = Link.all
      titles = links.map(&:title)
      urls = links.map(&:url)
      expect(titles).not_to include 'google'
      expect(titles).to include 'tweeter'
      expect(urls).to include 'http://www.tweeter.com'
    end
  end

end
