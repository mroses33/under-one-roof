class AddFriendMailer < ApplicationMailer
  def add_friend_email
    @guest_booking = params[:guest_booking]
    mail(to: @guest_booking.user.email, subject: "Yaaaay! You were added to experience! Come and check!")
  end
end
