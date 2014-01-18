class Version < ActiveRecord::Base
  belongs_to :package
  belongs_to :slackware_version
end
