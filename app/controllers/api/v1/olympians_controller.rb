class Api::V1::OlympiansController < ApplicationController

  def index
    render json: OlympiansFacade.all_olympians
  end

end
