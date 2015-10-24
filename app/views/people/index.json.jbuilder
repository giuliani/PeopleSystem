json.array!(@people) do |person|
  json.extract! person, :full_name, :email, :age
  json.url person_url(person, format: :json)
end
