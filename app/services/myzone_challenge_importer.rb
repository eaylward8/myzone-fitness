# frozen_string_literal: true

class MyzoneChallengeImporter
  LOGIN_URL = 'https://www.myzonemoves.com/calls/login/'
  CHALLENGE_ID = 'daf4797f-ecf2-11e9-943f-ac1f6b49537a'
  DATA_URL = "https://www.myzonemoves.com/sessioncalls/challenges/challengedetail/?guid=#{CHALLENGE_ID}"

  def initialize
    @agent = Mechanize.new
    @username = Rails.application.credentials.dig(:myzone, :username)
    @password = Rails.application.credentials.dig(:myzone, :password)
  end

  def import
    login
    data = fetch_data

    binding.pry
  end

  private

  def login
    @agent.post(LOGIN_URL, e: @username, p: @password) # Sets authentication cookie
  end

  def fetch_data
    JSON.parse(@agent.get(DATA_URL).body)['leaderboard']
  end
end
