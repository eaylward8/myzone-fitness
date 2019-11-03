# frozen_string_literal: true

class Athlete < ApplicationRecord
  has_many :challenge_totals, dependent: :destroy

  validates :myzone_usr_guid, uniqueness: true

  def self.sat_taker
    joins(:challenge_totals).group(:name).sum('challenge_totals.points').min_by { |name, points| points }[0]
  end

  def line_chart_data
    challenge_totals.group_by_hour(:created_at).sum(:points).delete_if { |_k, v| v.zero? }
  end
end
