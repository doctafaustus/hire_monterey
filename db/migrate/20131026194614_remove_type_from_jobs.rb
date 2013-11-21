class RemoveTypeFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :type
  end

  def down
    add_column :jobs, :type, :string
  end
end
