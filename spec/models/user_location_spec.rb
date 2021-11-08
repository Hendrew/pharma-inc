# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserLocation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:coordinates).dependent(:delete) }
    it { is_expected.to have_one(:timezone).dependent(:delete) }
  end
end
