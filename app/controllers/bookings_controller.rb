class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @game = Game.find(params[:game_id])
    @booking = Booking.new
  end

  def create
    @game = Game.find(params[:game_id])
    @booking = Booking.new(params_booking)
    @booking.game = @game
    @booking.game = current_user
    @booking.status = 0

    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(params_bookings)
    if @booking.save!
      redirect_to bookings_path
    else
      render :edit
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def params_bookings
    params.require(:booking).permit(:user_id, :game_id, :start_date, :end_date)
  end
end
