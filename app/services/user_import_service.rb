# frozen_string_literal: true

class UserImportService < ApplicationService
  include HTTParty
  base_uri 'https://randomuser.me/api'

  def perform
    current_page  = 1
    users_by_page = 100
    maximum_pages = 20

    loop do
      results = fetch_users(current_page, users_by_page)
      next if results == false

      save_data(results)

      break if current_page == maximum_pages

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
    save_user_name(get_user_name_params(result['name']), user)
    save_user_location(get_user_location_params(result['location']), user, result['location']['coordinates'],
                       result['location']['timezone'])
    save_user_picture(get_user_picture_params(result['picture']), user)
  end

  def save_access_data(result, user)
    save_user_login(get_user_login_params(result['login']), user)
    save_user_dob(get_user_dob_params(result['dob']), user)
    save_user_registered(get_user_registered_params(result['registered']), user)
    save_user_id(get_user_id_params(result['id']), user)
  end

  def save_user(user_params)
    user = User.create(user_params)
    user.persisted? ? user : false
  end

  def save_user_name(user_name_params, user)
    UserName.create(user_name_params.merge(user: user))
  end

  def save_user_location(user_location_params, user, coordinates_result, timezone_result)
    user_location = UserLocation.create(user_location_params.merge(user: user))
    save_user_location_coordinates(get_user_location_coordinates_params(coordinates_result), user_location)
    save_user_location_timezone(get_user_location_timezone_params(timezone_result), user_location)
  end

  def save_user_location_coordinates(user_location_coordinates_params, user_location)
    UserLocationCoordinate.create(user_location_coordinates_params.merge(user_location: user_location))
  end

  def save_user_location_timezone(user_location_timezone_params, user_location)
    UserLocationTimezone.create(user_location_timezone_params.merge(user_location: user_location))
  end

  def save_user_login(user_login_params, user)
    UserLogin.create(user_login_params.merge(user: user))
  end

  def save_user_dob(user_dob_params, user)
    UserDob.create(user_dob_params.merge(user: user))
  end

  def save_user_registered(user_registered_params, user)
    UserRegistered.create(user_registered_params.merge(user: user))
  end

  def save_user_id(user_id_params, user)
    UserId.create(user_id_params.merge(user: user))
  end

  def save_user_picture(user_picture_params, user)
    UserPicture.create(user_picture_params.merge(user: user))
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

  def get_user_name_params(result)
    user_name_params = {}
    user_name_params.store('title', result['title'])
    user_name_params.store('first', result['first'])
    user_name_params.store('last', result['last'])
    user_name_params
  end

  def get_user_location_params(result)
    user_location_params = {}
    user_location_params.store('street', result['street'].values.join(' '))
    user_location_params.store('city', result['city'])
    user_location_params.store('state', result['state'])
    user_location_params.store('postcode', result['postcode'])
    user_location_params
  end

  def get_user_location_coordinates_params(result)
    user_location_coordinates_params = {}
    user_location_coordinates_params.store('latitude', result['latitude'])
    user_location_coordinates_params.store('longitude', result['longitude'])
    user_location_coordinates_params
  end

  def get_user_location_timezone_params(result)
    user_location_timezone_params = {}
    user_location_timezone_params.store('offset', result['offset'])
    user_location_timezone_params.store('description', result['description'])
    user_location_timezone_params
  end

  def get_user_login_params(result)
    user_login_params = {}
    user_login_params.store('uuid', result['uuid'])
    user_login_params.store('username', result['username'])
    user_login_params.store('password', result['password'])
    user_login_params.store('salt', result['salt'])
    user_login_params.store('md5', result['md5'])
    user_login_params.store('sha1', result['sha1'])
    user_login_params.store('sha256', result['sha256'])
    user_login_params
  end

  def get_user_dob_params(result)
    user_dob_params = {}
    user_dob_params.store('date', result['date'])
    user_dob_params.store('age', result['age'])
    user_dob_params
  end

  def get_user_registered_params(result)
    user_registered_params = {}
    user_registered_params.store('date', result['date'])
    user_registered_params.store('age', result['age'])
    user_registered_params
  end

  def get_user_id_params(result)
    user_id_params = {}
    user_id_params.store('name', result['name'])
    user_id_params.store('value', result['value'])
    user_id_params
  end

  def get_user_picture_params(result)
    user_picture_params = {}
    user_picture_params.store('large', result['large'])
    user_picture_params.store('medium', result['medium'])
    user_picture_params.store('thumbnail', result['thumbnail'])
    user_picture_params
  end
end
