json.array!(@slackwares) do |slackware|
  json.extract! slackware, :id, :version
  json.url slackware_url(slackware)
end
