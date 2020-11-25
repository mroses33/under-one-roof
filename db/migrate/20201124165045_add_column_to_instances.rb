class AddColumnToInstances < ActiveRecord::Migration[6.0]
  def change
    add_column :instances, :date, :date
  end
end
