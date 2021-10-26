# frozen_string_literal: true

class UserLocation < ApplicationRecord
  # Relationship
  belongs_to :user

  has_one :user_location_coordinate, dependent: :delete
  has_one :user_location_timezone, dependent: :delete
end
