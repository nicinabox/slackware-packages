class CreateSlackwareVersions < ActiveRecord::Migration
  def change
    create_table :slackware_versions do |t|
      t.string :version

      t.timestamps
    end
  end
end
