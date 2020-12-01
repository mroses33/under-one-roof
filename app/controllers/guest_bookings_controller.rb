class GuestBookingsController < ApplicationController
  def create
    @guest_booking = GuestBooking.new(strong_params)
    @booking = Booking.find(params[:booking_id])
    @guest_booking.booking = @booking
    if @guest_booking.save
      AddFriendMailer.with(guest_booking: @guest_booking).add_friend_email.deliver_now
      redirect_to booking_path(@booking), notice: "Your invitation was sent to #{@guest_booking.user.email}"
    else
      flash.now[:error] = "Your invitation form had some errors. Please check the form and resubmit."
    end
  end

  private

  def strong_params
    params.require(:guest_booking).permit(:user_id)
  end
end
