class BookingsController < ApplicationController
  before_action :find_experience, only: [:new, :create, :show]
  def new
    @booking = Booking.new
  end

  def create
    @booking
  end

  def show
  end

  def edit

  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_show_path, notice: 'Your booking was deleted.'
  end

  private

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end
end
