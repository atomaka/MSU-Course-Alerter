class RecreateAlerts < ActiveRecord::Migration
  def up
    create_table :alerts do |t|
      t.integer :user_id
      t.string :department
      t.string :course
      t.string :semester
      t.text :sections
      t.boolean :alerted

      t.timestamps
    end
  end

  def down
    drop_table :alerts
  end
end
