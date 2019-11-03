# frozen_string_literal: true

class ChallengeTotal < ApplicationRecord
  belongs_to :athlete

  validates :points, numericality: { greater_than: 0 }

  scope :most_recent, -> { order(created_at: :desc).limit(8) }

  scope :most_recent_low_to_high, -> { where(id: most_recent.pluck(:id)).order(:points) }
end
