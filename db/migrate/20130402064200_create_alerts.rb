class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :user_id
      t.string :department
      t.string :course
      t.boolean :alerted

      t.timestamps
    end
  end
end
