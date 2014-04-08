class LinesController < ApplicationController

  def index
    @lines = Line.all
    if !@line
      @line = Line.new
    end
  end

  def create
    @line = Line.new(params[:line])
    if @line.save
      flash[:notice] = "Line created"
      redirect_to("/lines")
    else
      index
    end
  end

  def show
    @line = Line.find(params[:id])
  end

  def update
    show
    if @line.update(params[:line])
      flash[:notice] = "Line Updated"
      redirect_to("/lines/#{@line.id}")
    else
      index
    end
  end

  def destroy
    show
    if @line.destroy
      flash[:notice] = "Line Deleted"
      redirect_to('/lines')
    else
      show
    end
  end

  private
  def user_params
    params.require(:line).permit(:name)
  end
end

