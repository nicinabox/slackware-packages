json.extract! @package, :id, :name

# json.versions @package.versions,
#   :id, :version, :build, :arch,
#   :size_compressed, :size_uncompressed,
#   :summary, :description,
#   :file_name, :path,
#   :slackware_version

json.versions @package.versions do |version|
  json.(version,  :id, :version, :build, :arch,
                  :size_compressed, :size_uncompressed,
                  :summary, :description,
                  :file_name, :path)

  json.slackware version.slackware_version.version
end
