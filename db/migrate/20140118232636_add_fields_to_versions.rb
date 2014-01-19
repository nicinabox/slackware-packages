class AddFieldsToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :location, :string
    add_column :versions, :path, :string
  end
end
