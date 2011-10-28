class AddTodoToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :todo, :string
  end

  def self.down
    remove_column :tasks, :todo
  end
end
