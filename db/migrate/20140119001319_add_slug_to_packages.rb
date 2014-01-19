class AddSlugToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :slug, :string
  end
end
