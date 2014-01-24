json.extract! @package, :id, :name, :slug
json.versions @package.versions,
  partial: 'packages/version',
  as: :version
