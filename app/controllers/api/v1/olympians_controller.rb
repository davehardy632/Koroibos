class Api::V1::OlympiansController < ApplicationController

  def index
    render json: OlympiansFacade.all_olympians
  end
  
  def show
    if params["age"] == "youngest"
      render json: OlympiansFacade.youngest_olympian
    elsif params["age"] == "oldest"
      render json: OlympiansFacade.oldest_olympian
    elsif params["age"] != "youngest" || "oldest"
      render json: invalid_params_error
    end
  end

  def invalid_params_error
    {
      error: "Invalid paramters",
      status: 400
    }
  end
end
