Fabricator(:district) do
  name      { Faker::Name.name }
  zip       { Faker::Address.zip }
  email     { Faker::Internet.email }
  prefix    { Vehicle.plates.keys.shuffle.first }
  latitude  { 53.57532 }
  longitude { 10.01534 }
end
