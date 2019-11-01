# frozen_string_literal: true

class Athlete < ApplicationRecord
  has_many :workouts, dependent: :destroy

  validates :myzone_usr_guid, uniqueness: true
end
