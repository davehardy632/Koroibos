class Api::V1::TopTenOlympiansController < ApplicationController

  def index
    render json: TopOlympiansFacade.return_top_ten
  end
end
