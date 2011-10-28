class AddDateToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :date, :string
  end

  def self.down
    remove_column :tasks, :date
  end
end
