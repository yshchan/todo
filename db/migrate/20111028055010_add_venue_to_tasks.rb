class AddVenueToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :venue, :string
  end

  def self.down
    remove_column :tasks, :venue
  end
end
