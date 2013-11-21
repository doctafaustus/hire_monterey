class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :company
      t.integer :location
      t.string :type
      t.string :salary
      t.text :description

      t.timestamps
    end
  end
end
