class StationsController < ApplicationController

  def index
    @stations = Station.all
    if !@station
      @station = Station.new
    end
  end

  def create
    @station = Station.new(params[:station])
    if @station.save
      flash[:notice] = "Station created"
      redirect_to("/stations")
    else
      index
    end
  end

  def show
    @station = Station.find(params[:id])
  end

  def update
    show
    if @station.update(params[:station])
      flash[:notice] = "Station Updated"
      redirect_to("/stations/#{@station.id}")
    else
      index
    end
  end

  def destroy
    show
    if @station.destroy
      flash[:notice] = "Station Deleted"
      redirect_to('/stations')
    else
      show
    end
  end
end
  # private
  # def user_params
  #   params.require(:user).permit(:name)
  # end


