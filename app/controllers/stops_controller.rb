class StopsController < ApplicationController

  def index
    @stops = Stop.all
  end

  def create
    @stop = Stop.new(params[:stop])
    if @stop.save
      flash[:notice] = "Stop created"
      stop_params = params[:stop]
      puts stop_params[:line_id]
      redirect_to("/lines/#{stop_params[:line_id]}")
    else
      render 'index'
    end
  end
end
