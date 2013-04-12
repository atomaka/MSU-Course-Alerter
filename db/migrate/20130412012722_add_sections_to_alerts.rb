class AddSectionsToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :sections, :text
  end
end
