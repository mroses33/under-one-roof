class UsersController < ApplicationController
  def show

    @user = current_user
    @experiences = Experience.where(host_id: current_user.id)
    @bookings = Booking.where(customer_id: current_user.id)
    @favorites = Favorite.where(customer_id: current_user.id)
    qrcode = RQRCode::QRCode.new("http://github.com/")

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
    params.require(:user).permit(:name, :bio, :photo)
  end
end
