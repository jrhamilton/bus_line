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
      flash[:alert] = @stop.errors.full_messages
      stop_params = params[:stop]
      redirect_to("/lines/#{stop_params[:line_id]}")
    end
  end

  private
  def user_params
    params.require(:stop).permit(:station_id, :line_id, :stop_time)
  end
end
