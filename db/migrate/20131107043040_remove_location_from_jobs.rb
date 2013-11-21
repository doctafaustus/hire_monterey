class RemoveLocationFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :location
  end

  def down
    add_column :jobs, :location, :integer
  end
end
