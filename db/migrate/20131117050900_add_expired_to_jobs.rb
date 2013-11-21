class AddExpiredToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :expired, :boolean
  end
end
