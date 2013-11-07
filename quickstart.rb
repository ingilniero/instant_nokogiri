require 'open-uri'
require 'nokogiri'
require 'sinatra'

data = open('http://nytimes.com')

doc = Nokogiri::HTML(data)

ny_times_headline = doc.at_css('h2 a').content.gsub(/\n/,'').strip

ny_times_link = doc.at_css('h2 a').get_attribute('href')

html = '<h1>Nokogiri News Service</h1>'
html << "<h2>Top Story: <a href='#{ny_times_link}'>#{ny_times_headline}</a></h2>"

get '/' do
  html
end
