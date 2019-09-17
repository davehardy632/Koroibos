class Api::V1::MedalistsController < ApplicationController

  def index
    render json: MedalistsFacade.return_medalists(medalist_params["id"])
  end

  private

  def medalist_params
    params.permit("id")
  end

end
