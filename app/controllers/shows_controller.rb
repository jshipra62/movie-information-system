class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  before_action :adminauthorize, only: [:index, :show, :new, :edit, :destroy]

  def index
    @shows = Show.all
  end

  def show
  end

  def new
    @show = Show.new
  end

  def edit
  end

  def create
    @show = Show.new(show_params)

     if @show.save
      flash[:success] = "Show is successfully created."
      redirect_to @show
    else
      render :new
    end
  end

  def update
    @show = Show.find(params[:id]) 
    if @show.update(show_params)
      flash[:notice] = "Show updated successfully!"
      redirect_to @show
    else
      render 'edit'
    end
  end

  def destroy
    @show = Show.find(params[:id]) 
    @show.destroy
    flash[:notice] = "Show deleted successfully!"
    redirect_to @show
  end

  private
    def set_show
      @show = Show.find(params[:id])
    end

    def show_params
      params.require(:show).permit(:movie_id, :theater_id, slots_attributes: [ :id, :time, :_destroy ])
    end
end
