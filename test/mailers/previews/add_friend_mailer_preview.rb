# Preview all emails at http://localhost:3000/rails/mailers/add_friend_mailer
class AddFriendMailerPreview < ActionMailer::Preview
def add_friend_email
    # Set up a temporary order for the preview
    order = GuestBooking.new(booking_id: @guest_booking.booking_id, user_id: @guest_booking.user_id)

    AddFriendMailer.with(guest_booking: order).add_friend_email
  end
end
