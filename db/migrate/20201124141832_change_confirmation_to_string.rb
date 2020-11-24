class ChangeConfirmationToString < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :confirmation, :string, default: "Pending"
  end
end
