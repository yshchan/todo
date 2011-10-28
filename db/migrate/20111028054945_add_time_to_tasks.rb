class AddTimeToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :time, :string
  end

  def self.down
    remove_column :tasks, :time
  end
end
