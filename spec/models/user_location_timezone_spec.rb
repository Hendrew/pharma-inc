# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserLocationTimezone, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:location).class_name('UserLocation').optional }
  end
end
