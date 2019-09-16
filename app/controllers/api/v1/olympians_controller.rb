class Api::V1::OlympiansController < ApplicationController

  def index
    render json: OlympiansSerializer.all_olympians
  end

end
