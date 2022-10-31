class BooksController < ApplicationController
 
   def index
    # binding.pry
    @user = current_user
    @books = Book.all
    # binding.pry
   end

  def new
    @user = current_user
    @book = Book.new
  end


  def create
    @user = current_user
    @book = Book.new(params.require(:book).permit(:room_name, :room_introduce, :fee, :addres, :room_image ))
    # binding.pry
    if @book.save
      # binding.pry
      redirect_to :books, notice: "保存しました。"
    else
      # binding.pry
      flash[:alert] = "問題が発生しました。"
      render :new
    end
  end


  def show
    @books = Book.find(params[:id])
    @reservation = Reservation.new
  end
  

  def update
    new_params = book_params
    if @book.update(new_params)
      flash[:notice] = "保存しました。"
    else
      flash[:alert] = "問題が発生しました。"
    end
    redirect_back(fallback_location: request.referer)
  end

  def search
     @user = current_user
     @books = Book.where('rooms.address LIKE(?)',"%#{params[:addres]}%")
   if params[:keyword].present?
     @books = Book.where([ 'books.addres LIKE ? OR books.introduce LIKE ? OR books.room_name LIKE ? ', "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%" ])
   end
  end

  
  private
    
    def book_params
      params.require(:book).permit(:room_name, :room_introduce, :fee, :addres, :room_image)
    end
    
    def reservation_params
      params.require(:book).permit(:room_name,:room_introduce,:fee,:addres,:room_image,:user_id)
    end

end
