class GuestBookingsController < ApplicationController
  def create
    @guest_booking = GuestBooking.new(strong_params)
    @booking = Booking.find(params[:booking_id])
    @guest_booking.booking = @booking
    @guest_booking.save!
    redirect_to booking_path(@booking)
  end

  private

  def strong_params
    params.require(:guest_booking).permit(:user_id)
  end
end
