# frozen_string_literal: true

class Athlete < ApplicationRecord
  has_many :workouts, dependent: :destroy
end
