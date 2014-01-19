require 'slapp'
require 'httparty'

class SlackwareVersion < ActiveRecord::Base
  validates :version, uniqueness: true
  has_many :versions

  class << self
    def populate(version)
      types = %w(slackware patches)

      types.each do |type|
        file         = File.join version_dir(version), type, 'PACKAGES.TXT'
        packages_txt = File.join(Rails.root, 'tmp', file)

        FileUtils.mkdir_p File.dirname packages_txt

        unless File.exists? packages_txt
          File.open(packages_txt, "w") do |f|
            f.write HTTParty.get(host + file).parsed_response
          end
        end

        parser = Slapp::Parser.new(packages_txt)
        pkgs   = parser.packages
        total  = pkgs.count

        # Slackware version
        slackware_version = self.find_or_create_by version: version

        pkgs.each_with_index do |pkg, i|
          data = pkg.to_hash

          # Package
          package = Package.find_or_create_by(
            name: data[:name]
          )

          # Version
          package.versions.create!(
            version: data[:version],
            arch: data[:arch],
            build: data[:build],
            summary: data[:summary],
            description: data[:description],
            original_description: data[:original_description],
            file_name: data[:file_name],
            location: data[:location],
            path: data[:path],
            size_uncompressed: data[:size][:uncompressed],
            size_compressed: data[:size][:compressed],
            slackware_version: slackware_version
          )

          puts "Saved #{package.name} (#{total - i} remaining)"
        end
      end
    end

  private

    def host
      'http://slackware.cs.utah.edu/pub/slackware'
    end

    def version_dir(version)
      "/slackware-#{version}"
    end
  end

end
