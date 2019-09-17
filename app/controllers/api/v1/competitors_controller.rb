class Api::V1::CompetitorsController < ApplicationController

  def index
    render json: CompetitorFacade.return_competitors(competitor_params)
  end

  private

  def competitor_params
    params.permit("id")
  end

end
