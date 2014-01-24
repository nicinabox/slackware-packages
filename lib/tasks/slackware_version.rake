def populate(sw_version)
  types = %w(slackware slackware64)
  targets = %w(slackware patches)

  types.each do |type|
    # Slackware version
    slackware_version = SlackwareVersion.find_or_create_by version: sw_version

    targets.each do |target|
      file         = File.join version_dir(type, sw_version, target), 'PACKAGES.TXT'
      packages_txt = File.join(Rails.root, 'tmp', file)

      FileUtils.mkdir_p File.dirname packages_txt

      unless File.exists? packages_txt
        File.open(packages_txt, "w") do |f|
          response = HTTParty.get(host + file)
          response.body.force_encoding('UTF-8')
          f.write response.body
        end
      end

      puts "Using #{packages_txt}"
      parser   = Slapp::Parser.new(packages_txt, sw_version)
      packages = parser.packages
      total    = packages.count
      puts "Saving #{total} versions"

      packages.each do |pkg|
        # Package
        package = Package.find_or_create_by(
          name: pkg.name
        )

        # Version
        hash = pkg.to_hash.reject { |k, v| [:name].include? k }

        version = package.versions.create!(
          hash.merge(
            slackware_version: slackware_version
          )
        )

        puts "#{package.name} has #{package.versions.count} versions"

      end
    end
  end
end

def host
  'http://slackware.cs.utah.edu/pub'
end

def version_dir(type, sw_version, target)
  if type == "slackware64" and target == "slackware"
  "/slackware/#{type}-#{sw_version}/#{type}"
  else
    "/slackware/#{type}-#{sw_version}/#{target}"
  end
end

namespace :slackware do
  desc "Add slackware version"
  task :add, [:version] => :environment do |t, args|
    populate args[:version]
  end
end
