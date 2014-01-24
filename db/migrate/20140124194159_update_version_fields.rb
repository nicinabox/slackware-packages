class UpdateVersionFields < ActiveRecord::Migration
  def change
    add_column :versions, :package_name, :string
  end
end
