# frozen_string_literal: true

class Athlete < ApplicationRecord
  has_many :challenge_totals, dependent: :destroy

  validates :myzone_usr_guid, uniqueness: true

  CHALLENGE_START = Date.new(2019, 10, 14)

  def self.standings
    includes(:challenge_totals).group(:name).maximum(:points).sort_by { |_name, points| -points }
  end

  def line_chart_data
    challenge_totals.group_by_hour(:created_at).sum(:points).delete_if { |_k, v| v.zero? }
  end
end
