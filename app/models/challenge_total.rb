# frozen_string_literal: true

class ChallengeTotal < ApplicationRecord
  belongs_to :athlete

  validates :points, numericality: { greater_than: 0 }
end
