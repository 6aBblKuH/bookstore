# frozen_string_literal: true

module FeatureHelper
  def sign_in(user, location = nil)
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    first('[name = commit]').click
    visit(location) if location
  end

  def fill_address(type, address)
    fill_in("#{type}_first_name", with: address.first_name)
    fill_in("#{type}_last_name", with: address.last_name)
    fill_in("#{type}_address", with: address.address)
    fill_in("#{type}_city", with: address.city)
    fill_in("#{type}_zip", with: address.zip)
    select('Ukraine', from: "#{type}_country")
    fill_in("#{type}_phone", with: address.phone)
  end

  def fill_card(card)
    fill_in('credit_card_number', with: card[:number])
    fill_in('credit_card_card_name', with: card[:card_name])
    fill_in('credit_card_expiration_date', with: card[:expiration_date])
    fill_in('credit_card_cvv', with: card[:cvv])
  end
end
