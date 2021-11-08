# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:name).dependent(:delete) }
    it { is_expected.to have_one(:location).dependent(:destroy) }
    it { is_expected.to have_one(:login).dependent(:delete) }
    it { is_expected.to have_one(:dob).dependent(:delete) }
    it { is_expected.to have_one(:registered).dependent(:delete) }
    it { is_expected.to have_one(:user_id).dependent(:delete) }
    it { is_expected.to have_one(:picture).dependent(:delete) }
  end
end
