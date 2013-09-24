class CreateActivitySessions < ActiveRecord::Migration
  def change
    create_table :activity_sessions do |t|
      t.float :total_time
      t.float :timer_increment
      t.float :time_left
      t.integer :user_id
      t.string :state

      t.timestamps
    end
  end
end
