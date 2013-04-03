class AddSemesterToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :semester, :string
  end
end
