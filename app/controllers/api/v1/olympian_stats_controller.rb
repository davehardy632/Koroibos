class Api::V1::OlympianStatsController < ApplicationController

  def index
    render json: StatsFacade.return_general_stats
  end

end
