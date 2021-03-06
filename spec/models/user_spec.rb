# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'check relations' do
    %i[addresses reviews orders credit_cards].each do |field|
      it "has many #{field}" do
        is_expected.to have_many(field)
      end
    end
  end
end
