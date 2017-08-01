Comment.delete_all
Post.delete_all
User.delete_all

users = []
posts = []
comments = []

50.times do
 users << User.create(password: "test123", username: Faker::HitchhikersGuideToTheGalaxy.character)
end

50.times do
 users << User.create(password: "test123", username: Faker::LordOfTheRings.character)
end

100.times do
  posts << Post.create(title: Faker::HitchhikersGuideToTheGalaxy.marvin_quote, body: Faker::HitchhikersGuideToTheGalaxy.quote, user: users.sample)
end

250.times do
  comments << Comment.create(text: Faker::StarWars.quote, post: posts.sample, user: users.sample)
end
