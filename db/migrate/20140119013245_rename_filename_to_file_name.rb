class RenameFilenameToFileName < ActiveRecord::Migration
  def change
    rename_column :versions, :filename, :file_name
  end
end
