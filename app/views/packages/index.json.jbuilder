json.array!(@packages) do |package|
  json.extract! package, :id, :name
  json.url package_url(package)
end
