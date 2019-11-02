# frozen_string_literal: true

class MyzoneChallengeImporter
  LOGIN_URL = 'https://www.myzonemoves.com/calls/login/'
  CHALLENGE_ID = 'daf4797f-ecf2-11e9-943f-ac1f6b49537a'
  DATA_URL = "https://www.myzonemoves.com/sessioncalls/challenges/challengedetail/?guid=#{CHALLENGE_ID}"

  def initialize
    @agent = Mechanize.new
    @username = Rails.application.credentials.dig(:myzone, :username)
    @password = Rails.application.credentials.dig(:myzone, :password)
    @athletes = Athlete.all
  end

  def import
    login
    data = fetch_data
    return if data.length < 8 # Expecting 8 records. If less, something must be wrong.

    create_athletes(data)
    create_challenge_totals(data)
  end

  private

  def login
    @agent.post(LOGIN_URL, e: @username, p: @password) # Sets authentication cookie
  end

  def fetch_data
    JSON.parse(@agent.get(DATA_URL).body)['leaderboard']
  end

  def create_athletes(data)
    return if Athlete.count >= 8

    data.each do |record|
      Athlete.where(myzone_usr_guid: record['usrGUID']).first_or_create(name: record['name'])
    end
  end

  def create_challenge_totals(data)
    data.each do |record|
      athlete = @athletes.find { |a| record['name'] == a.name }
      myzone_total = record['sort'].to_i # `sort` is the key where points are stored
      # recorded_total = athlete.workouts.sum(:points)
      # next if myzone_total == recorded_total # Skip if points haven't changed

      athlete.challenge_totals.create(points: myzone_total) # Create new workout with point differential
    end
  end
end
