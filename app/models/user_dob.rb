# frozen_string_literal: true

class UserDob < ApplicationRecord
  # Relationship
  belongs_to :user
end
