class Api::V1::CompetitorsController < ApplicationController

  def index
    begin
      render json: CompetitorFacade.return_competitors(competitor_params)
    rescue
      render json: error_message_response
    end
  end

  private

  def competitor_params
    params.permit("id")
  end

  def error_message_response
      {
        error: "Sport not Found",
        status: 404
      }
  end
end
