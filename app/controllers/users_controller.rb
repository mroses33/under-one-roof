class UsersController < ApplicationController
  def show
    @user = current_user
    @experiences = Experience.where(host_id: current_user.id)
    @bookings = Booking.where(customer_id: current_user.id)
  end
end
