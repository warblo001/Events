class AddStatusToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :status, :integer
  end
end
