class Api::V1::MedalCountController < ApplicationController

  def index
    render json: medal_count_facade.return_medal_data
  end

  private

  def medal_count_params
    params.permit("country")
  end

  def medal_count_facade
    MedalCountFacade.new(medal_count_params["country"])
  end
end
