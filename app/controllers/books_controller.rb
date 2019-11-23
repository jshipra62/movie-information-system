class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :userauthorize, only: [:show, :new, :index1]
  before_action :adminauthorize, only: [:index]

  def index
    @books = Book.all
  end
  
  def index1
    if params[:user_id]
      @books = Book.where(:user_id => params[:user_id])
      if @books.blank?
        flash.now.alert = "No booking history!"
      end
    end
  end

  def show    
  end

  def new
    @book = Book.new(theater_id: params[:theater_id], movie_id: params[:movie_id], show_id: params[:show_id], slot_id: params[:slot_id], bdate: params[:bdate], user_id: params[:user_id])
    @slot = Slot.find(params[:slot_id])
    @theater = Theater.find(params[:theater_id])
  end

  def edit
  end

  def create
    @book = Book.new(book_params)    
    if @book.save
      flash[:notice] = "Booking done successfully!"
      redirect_to @book
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:user_id, :theater_id, :movie_id, :show_id, :slot_id, :bdate, :bseat)
    end
end
