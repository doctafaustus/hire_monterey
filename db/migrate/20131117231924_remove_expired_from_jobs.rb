class RemoveExpiredFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :expired
  end

  def down
    add_column :jobs, :expired, :boolean
  end
end
