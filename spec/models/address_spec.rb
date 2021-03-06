# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { FactoryBot.create :address }

  context 'validates' do
    %i[first_name last_name address city zip country phone kind].each do |field|
      it "invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context 'check relations' do
    it 'belongs to addressable' do
      is_expected.to belong_to(:addressable)
    end
  end
end
