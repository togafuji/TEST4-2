class ReservationsController < ApplicationController

require "pry"

  def index
    @user = current_user
    @reservations = Reservation.all
  end

  def new
    @user = current_user
    @book = Book.find(params[:id])
    @reservation = Reservation.new
  end

  def confirm
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    
    if @reservation.invalid?
       @book = @reservation.book
       render "new", status: :unprocessable_entity
    else
      @book = @reservation.book
      @reservation.total_day = (@reservation.end_date - @reservation.start_date)/86400.to_i
      @reservation.total_price = (@book.fee * @reservation.total_day * @reservation.people).to_i
    end
    
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:book_id,:user_id,:start_date,:end_date,:price,:total_price,:people,:total_day))
    # binding.pry
    if params[:back] || !@reservation.save
       render "index", status: :unprocessable_entity
    #binding.pry
    else
       redirect_to  reservations_path(@reservation), notice: "予約が完了しました"
    #binding.pry
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