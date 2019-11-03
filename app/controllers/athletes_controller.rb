# frozen_string_literal: true

class AthletesController < ApplicationController
  def index
    # @athletes = Athlete.all.includes(:challenge_totals).order('challenge_totals.created_at DESC').limit(8)
    @standings = Athlete.standings
    @sat_taker = Athlete.sat_taker
  end

  def line_chart_data
    athletes = Athlete.includes(:challenge_totals)
    line_chart_data = athletes.map { |athlete| { name: athlete.name, data: athlete.line_chart_data } }
    render json: line_chart_data
  end
end
