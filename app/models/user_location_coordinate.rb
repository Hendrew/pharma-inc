# frozen_string_literal: true

class UserLocationCoordinate < ApplicationRecord
  # Relationship
  belongs_to :user_location
end
