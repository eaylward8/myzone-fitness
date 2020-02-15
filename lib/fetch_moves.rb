require 'httparty'
require 'json'
require 'pry-byebug'

class MoveDownloader
  BASE_URL = 'https://www.myzonemoves.com/sessioncalls/movesbyguid'
  DATA_PATH = Rails.root.join('data')
  MOVES_BY_CHALLENGE_FILE = 'movesbychallenge.json'

  attr_reader :mbc_data, :move_guids

  def initialize
    mbc_path = Rails.root.join(DATA_PATH, MOVES_BY_CHALLENGE_FILE)
    @mbc_data = JSON.load(File.open(mbc_path))['data']
    @move_guids = move_data.map { |move| move['GUID'] }
  end

  def download_files
    move_guids.each do |guid|
      # return if file exists. need last name and move_guid

      query = { query: { guid: guid } }
      res = HTTParty.get(BASE_URL, query)
      res_json = JSON.parse(res.body)
      lname = res_json['owner']['surname'].downcase

      new_path = DATA_PATH.join(lname, "#{guid}.json")

      file = File.new(new_path, 'w+')
      file.write(res.body)
      file.close
    end
  end
end



x = MoveDownloader.new
binding.pry

# path = Rails.root.join(DATA_PATH, 'movesbychallenge.json')
# data = JSON.load(File.open(path)) # contains other stuff I don't care about
# move_data = data['data']

# move_guids = move_data.map { |move| move['GUID'] }

guid = move_guids.first

# query = { query: { guid: guid } }
# res = HTTParty.get(BASE_URL, query)
# res_json = JSON.parse(res.body)

# lname = res_json['owner']['surname'].downcase

# new_path = DATA_PATH.join(lname, "#{guid}.json")

# file = File.new(new_path, 'w+')
# file.write(res.body)
# file.close





puts 'yo'

