class AddDefaultValue < ActiveRecord::Migration
  def up
    change_column :alerts, :alerted, :boolean, :default => false
  end

  def down
    change_column :alerts, :alerted, :boolean, :default => nil
  end
end
