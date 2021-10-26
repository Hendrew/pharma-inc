# frozen_string_literal: true

class User < ApplicationRecord
  # Relationship
  has_one :user_name,       dependent: :delete
  has_one :user_location,   dependent: :destroy
  has_one :user_login,      dependent: :delete
  has_one :user_dob,        dependent: :delete
  has_one :user_registered, dependent: :delete
  has_one :user_id,         dependent: :delete
  has_one :user_picture,    dependent: :delete
end
