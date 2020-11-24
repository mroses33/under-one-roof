class ChangeColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:experiences, :kid_friendly, false)
  end
end
