class CreateActivitySessionRewards < ActiveRecord::Migration
  def change
    create_table :activity_session_rewards do |t|
      t.integer :activity_session_id
      t.integer :reward_id
      t.integer :star_count, :default => 0
      t.integer :user_id
      t.text :description
      t.integer :star, :default => 0

      t.timestamps
    end
  end
end
