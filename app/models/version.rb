class Version < ActiveRecord::Base
  belongs_to :package
  belongs_to :slackware_version

  default_scope { order('version') }

  def tarball_name
    file_name.gsub(/\.\w{3}$/, '')
  end

  def patch
    path.include? 'patches'
  end
end
