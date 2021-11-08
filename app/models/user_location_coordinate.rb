# frozen_string_literal: true

class UserLocationCoordinate < ApplicationRecord
  # Relationship
  belongs_to :location, class_name: 'UserLocation', foreign_key: :user_location_id, optional: true
end
