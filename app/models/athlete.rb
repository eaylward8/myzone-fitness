# frozen_string_literal: true

class Athlete
  has_many :workouts, dependent: :destroy
end
