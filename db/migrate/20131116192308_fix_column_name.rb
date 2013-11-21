class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :jobs, :salary, :compensation
  end

  def down
  end
end
