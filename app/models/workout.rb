# frozen_string_literal: true

class Workout < ApplicationRecord
  belongs_to :athlete

  validates :points, numericality: { greater_than: 0 }
end
