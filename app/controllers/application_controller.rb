class ApplicationController < ActionController::API
  include Authentication
  attr_reader :current_user

  protected

  def respond(response = nil)
    if response.nil?
      render json: {}
    elsif response.is_a? ActiveRecord::Base
      render json: response
    elsif response.is_a? Success
      render json: response.data
    elsif response.is_a? Error
      render json: {errors: response.errors}, status: response.status
    else
      raise 'Response is invalid'
    end
  end
end
