class Api::V1::MedalCountController < ApplicationController

  def index
    if valid_country?
      render json: medal_count_facade.return_medal_data
    elsif !params.include?("country")
      render json: missing_parameter_error
    elsif !valid_country?
      render json: error_message_response
    end
  end

  private

  def medal_count_params
    params.permit("country")
  end

  def valid_country?
    if secure_facade.valid_country?
      true
    end
  end

  def secure_facade
    SecureFacade.new(medal_count_params["country"])
  end

  def medal_count_facade
    MedalCountFacade.new(medal_count_params["country"])
  end

  def error_message_response
      {
        error: "Country not Found",
        status: 404
      }
  end

  def missing_parameter_error
      {
        error: "Missing parameters",
        status: 400
      }
  end
end
