class BookingsController < ApplicationController
  before_action :set_experience, only: [:new, :create]
  before_action :set_booking, only: [:show, :edit, :update]

  def new
    @booking = Booking.new
  end

  def create
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
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_show_path, notice: 'Your booking was updated.'
  end

  def destroy
    @booking.destroy
    redirect_to bookings_show_path, notice: 'Your booking was deleted.'
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])

  end

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time, :customer_id, :experience_id)
  end
end
