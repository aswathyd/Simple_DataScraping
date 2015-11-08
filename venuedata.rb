require 'nokogiri'
require 'open-uri'
url = "https://foursquare.com/explore?mode=url&near=Arlington%2C%20MA&nearGeoId=72057594042857116&q=Food"
data = Nokogiri::HTML(open(url))

localvenues= data.css('.infoCol')
#puts localvenues
localvenues.each do |localvenue|
puts localvenue.at_css('.venueName').text
puts localvenue.at_css('.venueAddress').text
puts " "
end
