class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show, edit, update]

  def show
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review.new(params_review)
    @review.booking = @booking
    if @review.save
      redirect_to bookin_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(params_review)
    if @review.save
      redirect_to bookin_path(@booking)
    else
      render :edit
    end
  end

  private
\
  def set_review
    @review = Review.find(:id)
  end

  def params_review
    params.require(:review).permit(:rating, :booking_id, :comments)
  end
end
