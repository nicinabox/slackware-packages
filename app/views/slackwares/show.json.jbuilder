json.extract! @slackware, :id, :version
json.versions @slackware.versions,
  partial: 'packages/version',
  as: :version
