class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :viewable_type
      t.integer :viewable_id
      t.attachment :attachment
      t.timestamps
    end
  end
end
