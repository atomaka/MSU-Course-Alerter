class TempDropAlerts < ActiveRecord::Migration
  def up
    drop_table :alerts
  end

  def down
    #nope
  end
end
