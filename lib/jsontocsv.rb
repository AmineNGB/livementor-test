require "jsontocsv/version"
require 'csv'
require 'json'
require 'open-uri'

module Jsontocsv
  class Error < StandardError; end
   
    url = 'https://gist.githubusercontent.com/romsssss/6b8bc16cfd015e2587ef6b4c5ee0f232/raw/f74728a6ac05875dafb882ae1ec1deaae4d0ed4b/users.json'
    response = open(url).read
    users = JSON.parse(response)
    csv_options = { col_sep: ';', quote_char: '"' } 

    CSV.open("./file.csv", "wb") do |csv|
      csv << ["id","email","tags","profiles.facebook.id","profiles.facebook.picture","profiles.twitter.id","profiles.twitter.picture"]
      users.each do |user|
        csv <<  [user.values[0], user.values[1], user.values[2].join(','), user.values[3]["facebook"]["id"], user.values[3]["facebook"]["picture"], user.values[3]["twitter"]["id"], user.values[3]["twitter"]["picture"]]
      end
    end
    puts 'All objects from your json were set in file.csv '
  
end


