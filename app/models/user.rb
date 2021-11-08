# frozen_string_literal: true

class User < ApplicationRecord
  # Relationship
  has_one :name,       dependent: :delete,  class_name: 'UserName'
  has_one :location,   dependent: :destroy, class_name: 'UserLocation'
  has_one :login,      dependent: :delete,  class_name: 'UserLogin'
  has_one :dob,        dependent: :delete,  class_name: 'UserDob'
  has_one :registered, dependent: :delete,  class_name: 'UserRegistered'
  has_one :user_id,    dependent: :delete
  has_one :picture,    dependent: :delete, class_name: 'UserPicture'

  accepts_nested_attributes_for :name, :location, :login, :dob, :registered, :user_id, :picture

  # Enums
  enum status: { trash: 0, published: 1 }
end
