class Version < ActiveRecord::Base
  belongs_to :package
  belongs_to :slackware_version

  default_scope { order('version') }

  def patch
    path.include? 'patches'
  end

  def x64
    path.include? 'slackware64'
  end
end
