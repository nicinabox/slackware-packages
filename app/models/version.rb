class Version < ActiveRecord::Base
  belongs_to :package
  belongs_to :slackware_version

  def package_name
    file_name.gsub(/\.\w{3}$/, '')
  end
end
