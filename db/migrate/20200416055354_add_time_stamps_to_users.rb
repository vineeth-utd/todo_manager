class AddTimeStampsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_timestamps(:users)
  end
end
