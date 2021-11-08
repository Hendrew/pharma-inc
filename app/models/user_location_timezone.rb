# frozen_string_literal: true

class UserLocationTimezone < ApplicationRecord
  # Relationship
  belongs_to :location, class_name: 'UserLocation', optional: true
end
