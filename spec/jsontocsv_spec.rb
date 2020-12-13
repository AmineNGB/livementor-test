require_relative '../lib/jsontocsv.rb'

URL = "https://gist.githubusercontent.com/romsssss/6b8bc16cfd015e2587ef6b4c5ee0f232/raw/f74728a6ac05875dafb882ae1ec1deaae4d0ed4b/users.json"

RSpec.describe Jsontocsv do
  describe '#fetch_content' do
    it 'should return a data string' do
      first_object = JsonToConvert.new(URL)
      expect(first_object.fetch_content(URL)).to be_a String
    end
  end

  describe '#content_parser' do
    it 'should not have hashes in a hash' do
      first_object = JsonToConvert.new(URL)
      response = first_object.fetch_content(URL)
      data = first_object.content_parser(response).first
      data.each do |k, v|
        expect(v).not_to be_a Hash
      end
    end
  end

  describe '#create_or_update_csv' do
    it "Create a csv file" do
      a = JsonToConvert.new(URL)
      a.convert_json_to_csv
      expect(a).to be_a_kind_of(Object)
      expect(File).to exist("./file.csv")
    end
  end
end