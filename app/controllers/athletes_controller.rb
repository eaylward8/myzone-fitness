# frozen_string_literal: true

class AthletesController < ApplicationController
  def index
    @athletes = Athlete.includes(:challenge_totals)
    @line_chart_data = @athletes.map do |athlete|
      { name: athlete.name,
        data: athlete.challenge_totals.group_by_hour(:created_at).sum(:points).delete_if { |_k, v| v.zero? } }
    end
  end
end
