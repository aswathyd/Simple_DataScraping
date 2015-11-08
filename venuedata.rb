require 'nokogiri'
require 'open-uri'
require 'csv'

url = "https://foursquare.com/explore?mode=url&near=Arlington%2C%20MA&nearGeoId=72057594042857116&q=Food"
data = Nokogiri::HTML(open(url))

localvenues= data.css('.infoCol')
#puts localvenues

CSV.open("file.csv", "wb") do  |csv|
	csv <<["VenueName", "Address", "City", "Category"]
localvenues.each do |localvenue|
#puts localvenue.at_css('.venueName').text
#puts localvenue.at_css('.venueAddress').text
#puts " "

Name = localvenue.at_css('.venueName').text
Location = localvenue.at_css('.venueAddress').text
city = "Arlington"
category = "Food"
csv << [Name, Location, city, category]
end
end
   puts "upload complete!"
