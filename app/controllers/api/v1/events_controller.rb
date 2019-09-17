class Api::V1::EventsController < ApplicationController

  def index
    render json: EventsFacade.return_events
  end


end
