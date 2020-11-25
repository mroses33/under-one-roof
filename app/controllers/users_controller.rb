class UsersController < ApplicationController
  def show
    @user = current_user
    @experiences = Experience.where(host_id: current_user.id)
    @bookings = Booking.where(customer_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(strong_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def strong_params
    params.require(:user).permit(:name, :bio, photos:[])
  end
end
