# frozen_string_literal: true

class UserId < ApplicationRecord
  # Relationship
  belongs_to :user
end
