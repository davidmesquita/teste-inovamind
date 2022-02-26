require 'nokogiri'
require 'open-uri'

namespace :crawler do
  desc "Responsible to capture quotes from http://quotes.toscrape.com/"

  task :quotes => :environment do
    doc = Nokogiri::HTML(URI.open('http://quotes.toscrape.com/'))

    extract_quotes = doc.css('div.quote').map do |quote|
      QuoteSerializer.new(quote)
    end
  end
end
