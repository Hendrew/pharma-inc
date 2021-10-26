# frozen_string_literal: true

class UserPicture < ApplicationRecord
  # Relationship
  belongs_to :user
end
