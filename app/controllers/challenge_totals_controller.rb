# frozen_string_literal: true

class ChallengeTotalsController < ApplicationController
  def index
    @challenge_totals = ChallengeTotal.includes(:athlete).order(:created_at)
    @athletes = Athlete.includes(:challenge_totals)
  end
end
