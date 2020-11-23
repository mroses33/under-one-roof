class BookingsController < ApplicationController
  def new
    find_experience
    @booking = Booking.new
  end

  def create
    find_experience
    @booking
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end
end
