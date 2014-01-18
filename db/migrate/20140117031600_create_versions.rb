class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :version
      t.text :description
      t.text :original_description
      t.text :summary
      t.string :build
      t.string :arch
      t.integer :size_compressed
      t.integer :size_uncompressed
      t.string :filename
      t.integer :package_id
      t.integer :slackware_version_id

      t.timestamps
    end
  end
end
