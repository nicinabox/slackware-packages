class Version < ActiveRecord::Base
  belongs_to :package
  belongs_to :slackware_version

  def fullpath
    "/slackware/slackware-#{slackware_version.version}#{path}"
  end
end
