# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  attributes :gender, :name, :location, :email, :login, :dob, :registered, :phone, :cell, :user_id, :picture, :nat, :imported_at,
             :status

  attribute :name do |object|
    {
      title: object.name.title,
      first: object.name.first,
      last: object.name.last
    }
  end

  attribute :location do |object|
    {
      street: object.location.street,
      city: object.location.city,
      state: object.location.state,
      postcode: object.location.postcode,
      coordinates: {
        latitude: object.location.coordinates.latitude,
        longitude: object.location.coordinates.longitude
      },
      timezone: {
        offset: object.location.timezone.offset,
        description: object.location.timezone.description
      }
    }
  end

  attribute :login do |object|
    {
      uuid: object.login.uuid,
      username: object.login.username,
      password: object.login.password,
      salt: object.login.salt,
      md5: object.login.md5,
      sha1: object.login.sha1,
      sha256: object.login.sha256
    }
  end

  attribute :dob do |object|
    {
      date: object.dob.date,
      age: object.dob.age
    }
  end

  attribute :registered do |object|
    {
      date: object.registered.date,
      age: object.registered.age
    }
  end

  attribute :user_id do |object|
    {
      name: object.user_id.name,
      value: object.user_id.value
    }
  end

  attribute :picture do |object|
    {
      large: object.picture.large,
      medium: object.picture.medium,
      thumbnail: object.picture.thumbnail
    }
  end
end
