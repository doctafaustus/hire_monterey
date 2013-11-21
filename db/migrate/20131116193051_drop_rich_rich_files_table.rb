class DropRichRichFilesTable < ActiveRecord::Migration
  def up
  	drop_table :rich_rich_files
  end

  def down
  end
end
