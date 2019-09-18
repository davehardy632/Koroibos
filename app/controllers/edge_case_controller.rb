class EdgeCaseController < ApplicationController

  def index
    render json: error_message_response, status: 404
  end

  def error_message_response
      {
        error: "This endpoint is not supported",
        status: 404
      }
  end

end
