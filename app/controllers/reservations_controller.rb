class ReservationsController < ApplicationController

  def index
    @user = current_user
    @reservations = Reservation.all
  end

  def new
    @user = current_user
    @books = Book.find(params[:book_id])
    @reservation = Reservation.new
  end

  def confirm
    @user = current_user
    @reservations = Reservation.new(params.permit(:book_id,:user_id,:start_date,:end_date,:price,:total_price,:people,:total_day))
    
    if @reservations.invalid?
      @books = @reservations.book
      render "new"
    else
     @books = @reservations.book
     @reservations.total_day = (@reservations.end_date - @reservations.start_date).to_i
     @reservations.total_price = (@books.fee * @reservations.total_day * @reservations.people).to_i
    end
    
  end

  def create
    @reservation = Reservation.new(params.permit(:book_id,:user_id,:start_date,:end_date,:price,:total_price,:people,:total_day))
    if params[:back] || !@reservation.save
      render "index"
    else
      redirect_to  book_reservations_path, notice: "予約が完了しました"
    end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
    @books = @reservation.book_id

  end 

  private

  def reservation_params
    params.permit(:book_id,:user_id,:start_date,:end_date,:people)
  end
end