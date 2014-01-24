json.array!(@packages) do |package|
  json.extract! package, :id, :name, :slug
  json.url package_url(package)
end
