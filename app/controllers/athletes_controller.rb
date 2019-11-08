# frozen_string_literal: true

class AthletesController < ApplicationController
  def index
    @standings = Athlete.standings
  end

  def line_chart_data
    updated_at_sum = Athlete.pluck(:updated_at).map(&:to_i)
    line_chart_data = Rails.cache.fetch("#{updated_at_sum}/line_chart_data", expires_in: 12.hours) do
      athletes = Athlete.includes(:challenge_totals).order(:id)
      athletes.map { |athlete| { name: athlete.name, data: athlete.line_chart_data } }
    end
    Rails.logger.debug("\n #{line_chart_data.to_json} \n")
    render json: line_chart_data
  end
end
