# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    return handle_unsaved_resource unless resource.persisted?
    @order&.update(user: resource)
    resource.active_for_authentication? ? successful_response : unsuccessful_response
  end

  protected

  def update_resource(resource, params)
    if params['password']&.present?
      result = super
      set_flash_message!(:alert, :password_error) unless result
      return result
    end
    resource.update_without_password(params.except('current_password'))
  end

  def handle_unsaved_resource
    clean_up_passwords resource
    set_minimum_password_length
    respond_with resource
  end

  def successful_response
    set_flash_message! :notice, :signed_up
    sign_up(resource_name, resource)
    respond_with resource, location: after_sign_up_path_for(resource)
  end

  def unsuccessful_response
    set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
    expire_data_after_sign_in!
    respond_with resource, location: after_inactive_sign_up_path_for(resource)
  end
end
