# frozen_string_literal: true

class AthletesController < ApplicationController
  def index
    @athletes = Athlete.includes(:challenge_totals)
  end
end
