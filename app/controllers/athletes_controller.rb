# frozen_string_literal: true

class AthletesController < ApplicationController
  def index
    @athletes = Athlete.includes(:challenge_totals)
    @line_chart_data = @athletes.map { |athlete| { name: athlete.name, data: athlete.line_chart_data } }
    @sat_taker = Athlete.sat_taker
  end
end
