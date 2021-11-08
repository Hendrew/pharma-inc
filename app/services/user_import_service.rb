# frozen_string_literal: true

class UserImportService < ApplicationService
  include HTTParty
  base_uri 'https://randomuser.me/api'

  def perform
    current_page  = 1
    users_by_page = 100
    maximum_pages = 20

    while current_page <= maximum_pages
      results = fetch_users(current_page, users_by_page)
      next if results == false

      save_data(results)

      current_page += 1
    end
  end

  private

  def fetch_users(current_page, users_by_page)
    response = self.class.get("/?page=#{current_page}&results=#{users_by_page}")
    return response['results'] if response.code.to_i == 200

    false
  end

  def save_data(results)
    results.each do |result|
      user = save_user(get_user_params(result))
      next if user.blank?

      save_personal_data(result, user)
      save_access_data(result, user)
    end
  end

  def save_personal_data(result, user)
    save_name(get_name_params(result['name']), user)
    save_location(get_location_params(result['location']), user, result['location']['coordinates'],
                  result['location']['timezone'])
    save_picture(get_picture_params(result['picture']), user)
  end

  def save_access_data(result, user)
    save_login(get_login_params(result['login']), user)
    save_dob(get_dob_params(result['dob']), user)
    save_registered(get_registered_params(result['registered']), user)
    save_id(get_id_params(result['id']), user)
  end

  def save_user(user_params)
    user = User.create(user_params)
    user.persisted? ? user : false
  end

  def save_name(name_params, user)
    UserName.create(name_params.merge(user: user))
  end

  def save_location(location_params, user, coordinates_result, timezone_result)
    location = UserLocation.create(location_params.merge(user: user))
    save_coordinates(get_coordinates_params(coordinates_result), location)
    save_timezone(get_timezone_params(timezone_result), location)
  end

  def save_coordinates(coordinates_params, location)
    UserLocationCoordinate.create(coordinates_params.merge(user_location_id: location.id))
  end

  def save_timezone(timezone_params, location)
    UserLocationTimezone.create(timezone_params.merge(user_location_id: location.id))
  end

  def save_login(login_params, user)
    UserLogin.create(login_params.merge(user: user))
  end

  def save_dob(dob_params, user)
    UserDob.create(dob_params.merge(user: user))
  end

  def save_registered(registered_params, user)
    UserRegistered.create(registered_params.merge(user: user))
  end

  def save_id(id_params, user)
    UserId.create(id_params.merge(user: user))
  end

  def save_picture(picture_params, user)
    UserPicture.create(picture_params.merge(user: user))
  end

  def get_user_params(result)
    user_params = {}
    user_params.store('gender', result['gender'])
    user_params.store('email', result['email'])
    user_params.store('phone', result['phone'])
    user_params.store('cell', result['cell'])
    user_params.store('nat', result['nat'])
    user_params.store('imported_at', DateTime.current)
    user_params.store('status', 1)
    user_params
  end

  def get_name_params(result)
    name_params = {}
    name_params.store('title', result['title'])
    name_params.store('first', result['first'])
    name_params.store('last', result['last'])
    name_params
  end

  def get_location_params(result)
    location_params = {}
    location_params.store('street', result['street'].values.join(' '))
    location_params.store('city', result['city'])
    location_params.store('state', result['state'])
    location_params.store('postcode', result['postcode'])
    location_params
  end

  def get_coordinates_params(result)
    coordinates_params = {}
    coordinates_params.store('latitude', result['latitude'])
    coordinates_params.store('longitude', result['longitude'])
    coordinates_params
  end

  def get_timezone_params(result)
    timezone_params = {}
    timezone_params.store('offset', result['offset'])
    timezone_params.store('description', result['description'])
    timezone_params
  end

  def get_login_params(result)
    login_params = {}
    login_params.store('uuid', result['uuid'])
    login_params.store('username', result['username'])
    login_params.store('password', result['password'])
    login_params.store('salt', result['salt'])
    login_params.store('md5', result['md5'])
    login_params.store('sha1', result['sha1'])
    login_params.store('sha256', result['sha256'])
    login_params
  end

  def get_dob_params(result)
    dob_params = {}
    dob_params.store('date', result['date'])
    dob_params.store('age', result['age'])
    dob_params
  end

  def get_registered_params(result)
    registered_params = {}
    registered_params.store('date', result['date'])
    registered_params.store('age', result['age'])
    registered_params
  end

  def get_id_params(result)
    id_params = {}
    id_params.store('name', result['name'])
    id_params.store('value', result['value'])
    id_params
  end

  def get_picture_params(result)
    picture_params = {}
    picture_params.store('large', result['large'])
    picture_params.store('medium', result['medium'])
    picture_params.store('thumbnail', result['thumbnail'])
    picture_params
  end
end
