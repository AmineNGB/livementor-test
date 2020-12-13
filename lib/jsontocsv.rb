require "jsontocsv/version"
require 'csv'
require 'json'
require 'open-uri'

module Jsontocsv
  def convert_json_to_csv
    fetch_content(@url)
    content_parser(@response)
    create_or_update_csv(@data)
  end 

  def content_parser(response)
    @users = JSON.parse(response)
    @data = []
    @users.each do |row|
      row_checked = checked_hash(row)
      row_checked.each do |title, value|
        row_checked[title] = array_delimiter(value) if value.is_a? Array
      end
      @data << row_checked
    end
    @data
  end

  def array_delimiter(array)
    array.join(',')
  end

  def checked_hash(hash)
    h = {}
    hash.each do |key, value|
      if value.is_a? Hash
        checked_hash(value).each do |k, v|
          h["#{key}.#{k}"] = v
        end
      else
        h[key] = value
      end
    end
    h
  end
  
  def create_or_update_csv(array)
    csv_options = { col_sep: ';', quote_char: '"' }
    CSV.open("./file.csv", "wb") do |csv| 
      csv << array.first.keys
      array.each do |row|
        csv << row.values
      end
    end
    puts 'All objects from your json were set in file.csv '
  end
end

class JsonToConvert
  include Jsontocsv

  def initialize(url)
    @url = url
  end

  def fetch_content(url)
    @response = open(url).read
  end
end

a = JsonToConvert.new('https://gist.githubusercontent.com/romsssss/6b8bc16cfd015e2587ef6b4c5ee0f232/raw/f74728a6ac05875dafb882ae1ec1deaae4d0ed4b/users.json')
a.convert_json_to_csv
