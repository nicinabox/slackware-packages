json.cache! @slackware, expires_in: 10.minutes do
  json.extract! @slackware, :id, :version
  json.versions @slackware.versions,
    partial: 'packages/version',
    as: :version
end
