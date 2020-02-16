require 'httparty'
require 'json'

class MoveDownloader
  include HTTParty

  BASE_URL = 'https://www.myzonemoves.com/sessioncalls/movesbyguid'
  DATA_PATH = Rails.root.join('data')
  MOVES_BY_CHALLENGE_FILE = 'movesbychallenge.json'

  attr_reader :mbc_data, :owner_move_guids

  def initialize
    mbc_path = Rails.root.join(DATA_PATH, MOVES_BY_CHALLENGE_FILE)
    @mbc_data = JSON.load(File.open(mbc_path))['data']
    @owner_move_guids = @mbc_data.map { |move| [move['uName'].split(' ').last.downcase, move['GUID'] ] }
  end

  def download_files
    owner_move_guids.each do |owner_move_guid|
      owner, move_guid = owner_move_guid

      if file_exists?(owner, move_guid)
        puts "File #{move_guid} exists for #{owner}. Skipping..."
        next
      end

      download_file(owner, move_guid)
    end
  end

  def download_file(owner, move_guid)
    new_path = DATA_PATH.join(owner, "#{move_guid}.json")
    file = File.new(new_path, 'w+')
    file.write(move_json(move_guid)) # write GET response to file
    file.close
    puts "Saved #{move_guid} for #{owner}"
  end

  def move_json(move_guid)
    self.class.get(BASE_URL, { query: { guid: move_guid } })
  end

  def file_exists?(owner, move_guid)
    path = Rails.root.join(DATA_PATH, owner, "#{move_guid}.json")
    File.exists?(path)
  end
end

MoveDownloader.new.download_files
