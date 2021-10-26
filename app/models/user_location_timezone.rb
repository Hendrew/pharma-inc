# frozen_string_literal: true

class UserLocationTimezone < ApplicationRecord
  # Relationship
  belongs_to :user_location
end
