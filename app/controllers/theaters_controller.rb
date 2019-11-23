class TheatersController < ApplicationController
  before_action :set_theater, only: [:show, :edit, :update, :destroy]
  before_action :adminauthorize, only: [:index, :new, :edit, :destroy]

  def index
    @theaters = Theater.all
  end

  def show
  end

  def new
    @theater = Theater.new
  end

  def edit
  end

  def create
    @theater = Theater.new(theater_params)
    if @theater.save
      flash[:notice] = "Theater created successfully!"
      redirect_to @theater
    else
      render :new
    end
  end

  def update
    @theater =  Theater.find(params[:id]) 
    if @theater.update(theater_params)
      flash[:notice] = "Theater updated successfully!"
      redirect_to @theater
    else
      render 'edit'
    end
  end

  def destroy
    @theater.destroy
    flash.now.alert = "Theater deleted successfully!"
    redirect_to theaters_path
  end

  private
    def set_theater
      @theater = Theater.find(params[:id])
    end

    def theater_params
      params.require(:theater).permit(:name, :seats, :price)
    end
end
