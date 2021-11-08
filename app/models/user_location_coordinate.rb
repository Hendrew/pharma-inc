# frozen_string_literal: true

class UserLocationCoordinate < ApplicationRecord
  # Relationship
  belongs_to :location, class_name: 'UserLocation', optional: true
end
