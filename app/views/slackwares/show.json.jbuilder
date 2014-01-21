json.extract! @slackware, :id, :version
json.versions @slackware.versions do |version|
  json.(version, :id)
  json.name version.package.name
  json.(version,  :version, :build, :arch, :patch,
                  :size_compressed, :size_uncompressed,
                  :summary, :description,
                  :tarball_name, :file_name, :path)
end
