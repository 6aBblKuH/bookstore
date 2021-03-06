# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { FactoryBot.create :author }

  context 'validates' do
    %i[firstname lastname].each do |field|
      it "invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context 'check relations' do
    it 'has and belongs to many books' do
      is_expected.to have_and_belong_to_many(:books)
    end
  end
end
