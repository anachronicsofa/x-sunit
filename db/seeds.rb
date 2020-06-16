42.times do
  Survivor.create!(
    name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
    birthdate: Faker::Date.birthday(min_age: 1, max_age: 120),
    gender: %w[female male other],
    latitude: Faker::Number.number(digits: 3),
    longitude: Faker::Number.number(digits: 3)
  )
end
