# frozen_string_literal: true

class UserLocationTimezone < ApplicationRecord
  # Relationship
  belongs_to :location, class_name: 'UserLocation', foreign_key: :user_location_id, optional: true
end
