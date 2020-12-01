class BookingsController < ApplicationController
  require 'rqrcode'

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
      redirect_to pay_experience_booking_path(@experience, @booking)
    else
      render :new
    end
  end

  def show
    @guest_booking = GuestBooking.new
    @guest_bookings = @booking.guest_bookings

    qrcode = RQRCode::QRCode.new("+447470043682")

    # NOTE: showing with default options specified explicitly
    @svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_show_path, notice: 'Your booking was updated.'
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user.id)
  end

  def accept
    @booking = Booking.find(params[:booking_id])
    @booking.update(confirmation: "Accepted")
    redirect_to user_path(current_user.id)
  end

  def pay
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    @booking.update(confirmation: "Rejected")
    redirect_to user_path(current_user.id)
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
