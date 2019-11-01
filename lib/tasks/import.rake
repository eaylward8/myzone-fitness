# frozen_string_literal: true

namespace :import do
  desc 'Scrape MyZone Challenge data'
  task challenge: :environment do |_t, _args|
    importer = MyzoneChallengeImporter.new
    importer.import
  end
end
