# frozen_string_literal: true

module Api
  module V1
    class UsersController < BaseController
      before_action :load_user, only: %i[show update destroy]

      def index
        @users = User.order(created_at: :desc).limit 1
        render json: serialized_data(@users), status: :ok
      end

      def show
        render json: serialized_data(@user), status: :ok
      end

      def update
        if @user.update(user_params)
          render json: serialized_data(@user), status: :ok
        else
          render json: { errors: @user.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        head :no_content
      end

      private

      def load_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(
          :gender, :email, :phone, :cell, :nat, :imported_at, :status,
          name_attributes: name_attributes, location_attributes: location_attributes,
          login_attributes: login_attributes, dob_attributes: dob_attributes,
          registered_attributes: registered_attributes, user_id_attributes: user_id_attributes,
          picture_attributes: picture_attributes
        )
      end

      def name_attributes
        %i[id title first last]
      end

      def location_attributes
        [:id, :street, :city, :state, :postcode,
         { coordinates_attributes: %i[id latitude longitude],
           timezone_attributes: %i[id offset description] }]
      end

      def login_attributes
        %i[id uuid username password salt md5 sha1 sha256]
      end

      def dob_attributes
        %i[id date age]
      end

      def registered_attributes
        %i[id date age]
      end

      def user_id_attributes
        %i[id name value]
      end

      def picture_attributes
        %i[large medium thumbnail]
      end
    end
  end
end
