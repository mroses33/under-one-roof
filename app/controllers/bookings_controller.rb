class BookingsController < ApplicationController
  def new
    find_experience
    @booking = Booking.new
  end

  def create
    find_experience
    @customer = current_user
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.customer = @customer

    if @booking.save
      render :show
    else
      render :new
    end
  end

  def show
  end

  def edit
    find_booking
  end

  def update
    find_booking
    @booking.update(booking_params)
    redirect_to bookings_show_path
  end

  def destroy
  end

  private

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end

  def find_booking
    @booking = Booking.find(params[:booking_id])

  end

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time, :customer_id, :experience_id)
  end
end
