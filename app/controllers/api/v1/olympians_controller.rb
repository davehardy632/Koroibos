class Api::V1::OlympiansController < ApplicationController

  def index
    if params["age"] == "youngest"
      render json: OlympiansFacade.youngest_olympian
    elsif params["age"] == "oldest"
      render json: OlympiansFacade.oldest_olympian
    else
      render json: OlympiansFacade.all_olympians
    end
  end

end
