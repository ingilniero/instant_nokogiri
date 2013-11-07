require 'open-uri'
require 'nokogiri'

data = open('http://nytimes.com')

doc = Nokogiri::HTML(data)

ny_times_headline = doc.at_css('h2 a').content.gsub(/\n/,'').strip

ny_times_link = doc.at_css('h2 a').get_attribute('href')

p ny_times_headline
p ny_times_link
