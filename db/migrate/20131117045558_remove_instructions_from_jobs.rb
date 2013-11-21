class RemoveInstructionsFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :instructions
  end

  def down
    add_column :jobs, :instructions, :string
  end
end
