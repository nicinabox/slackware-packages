json.extract! @package, :id, :name
json.versions @package.versions,
  partial: 'packages/version',
  as: :version
