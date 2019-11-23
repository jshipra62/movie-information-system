class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :userauthorize, only: [:booking]
  before_action :adminauthorize, only: [:index1, :new, :edit, :destroy]

  def index
    @search = Movie.search(params[:q])
    @movies = @search.result(distinct: true)
  end

  def index1
    @movies = Movie.all
  end

  def home
    @movies = Movie.order(:rdate).first(3)
  end

  def show
    @movie = Movie.find(params[:id]) 
    @reviews = Review.where(movie_id: @movie.id)
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end
  
  def booking
    @movie = Movie.find(params[:id]) 
  end

  def ratings
    @movie = Movie.find(params[:id]) 
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)           
    if @movie.save
      flash[:notice] = "Movie created successfully!"
      redirect_to @movie
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id]) 
    if @movie.update(movie_params)
      flash[:notice] = "Movie updated successfully!"
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie was successfully destroyed."
    redirect_to admovies_path
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :synopsis, :rating, :rdate, :image, language_ids: [])
    end
end
