class AddApplicationInstructionsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :instructions, :string
  end
end
