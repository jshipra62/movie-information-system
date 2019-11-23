class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :userauthorize, only: [:show, :new, :index1, :edit, :destroy]
  before_action :adminauthorize, only: [:index]

  def index
    @reviews = Review.all
  end

  def index1
    if params[:user_id]
      @reviews = Review.where(:user_id => params[:user_id])
      if @reviews.blank?
        flash.now.alert = "No review history!"
      end
    end
  end

  def show
  end

  def new
    @review = Review.new(movie_id: params[:movie_id], user_id: params[:user_id])
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review
    else
      render 'new'
    end
  end

  def update    
    if @review.update(review_params)
      flash[:notice] = "Review updated successfully!"
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
   flash[:notice] = "Review deleted successfully!"
    if !current_user.nil?
      if !current_user.admin?
        @review.destroy
        redirect_to movies_path
      else
        @review.destroy
        redirect_to reviews_path
      end
    end
    
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:movie_id, :user_id, :rating, :comment)
    end
end
