namespace :slackware do
  desc "Add slackware version"
  task :add, [:version] => :environment do |t, args|
    SlackwareVersion.populate args[:version]
  end
end
