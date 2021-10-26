# frozen_string_literal: true

class UserLogin < ApplicationRecord
  # Relationship
  belongs_to :user
end
