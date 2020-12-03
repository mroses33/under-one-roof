class ReviewsController < ApplicationController
  def new
     @booking = Booking.find(params[:booking_id])
     @review = Review.new
  end

  def create
    @review = Review.new(strong_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @experience = @booking.experience
    if @review.save
      redirect_to experience_path(@review.booking.experience.id)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to booking_path(@review.booking.id)
  end

  private

  def strong_params
    params.require(:review).permit(:comment, :rating)
  end
end
