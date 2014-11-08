require 'open-uri'
class Main < ActiveRecord::Base

  def self.upcomingShows 
    link = open("http://www.songkick.com/artists/6404794-b-side-shuffle")

    doc = Nokogiri::HTML(link)

    events_array = []

    events = doc.css('.event-listings-with-tickets .event-row')

    events.each do |event|
      info = event.css('.event-info span')[0].text.split("\n")
      venue = info[1].strip
      area = info[2].strip
      date = event[:title].strip
      events_array << {date: date, area: area.split(",")[0], venue: venue.gsub(",","")}
    end

    return events_array

  end

  def self.recentBlogPosts 
    link = open("http://bsideshuffle.tumblr.com/")

    doc = Nokogiri::HTML(link)

    articles = doc.css('#posts article .post')
    article1 = {}
    article2 = {}
    article1[:title] = articles[0].css('h2 a').text
    article1[:link] = articles[0].css('h2 a')[0][:href]
    article1[:body] = articles[0].css('p').text[0..160]
    article1[:img] = articles[0].css('img')[0][:src]

    article2[:title] = articles[1].css('h2 a').text
    article2[:link] = articles[1].css('h2 a')[0][:href]
    article2[:body] = articles[1].css('p').text[0..160]
    article2[:img] = articles[1].css('img')[0][:src]

    [article1, article2]
  end

  def self.gallery
    link = open("http://imgur.com/a/GzInE/layout/blog")

    doc = Nokogiri::HTML(link)

    images = doc.css(".main .panel #image-container .textbox img")
    images_array = []
    images.each do |img|
      images_array << img[:src]
    end
    images_array[0..25]
  end
end
