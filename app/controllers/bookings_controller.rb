class BookingsController < ApplicationController
  before_action :find_experience, only: [:new, :create]
  before_action :set_booking, only: [:show, :edit, :update]

  def new
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
    find_booking
  end

  def edit
  end

  def update
    find_booking
    @booking.update(booking_params)
    redirect_to bookings_show_path,  notice: 'Your booking was updated.'
  end

  def destroy
    find_booking
    @booking.destroy
    redirect_to bookings_show_path, notice: 'Your booking was deleted.'
  end

  private

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])

  end

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time, :customer_id, :experience_id)
  end
end
