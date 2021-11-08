# frozen_string_literal: true

class UserLocation < ApplicationRecord
  # Relationship
  belongs_to :user

  has_one :coordinates, dependent: :delete, class_name: 'UserLocationCoordinate'
  has_one :timezone, dependent: :delete, class_name: 'UserLocationTimezone'

  accepts_nested_attributes_for :coordinates, :timezone
end
