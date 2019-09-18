class Api::V1::MedalistsController < ApplicationController

  def index
    begin
      render json: MedalistsFacade.return_medalists(medalist_params["id"])
    rescue
      render json: error_message_response
    end
  end

  private

  def medalist_params
    params.permit("id")
  end

  def error_message_response
    {
      error: "Event not Found",
      status: 404
    }
  end
  
end
