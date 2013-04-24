class ChangeAlertsSemesterType < ActiveRecord::Migration
  def up
    change_table :alerts do |t|
      t.change :semester, :enum
    end
  end

  def down
    change_table :alerts do |t|
      t.change :semester, :string
    end
  end
end
