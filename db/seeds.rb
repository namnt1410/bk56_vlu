User.create email: "namnt.1410@gmail.com", password: "12345678", password_confirmation: "12345678" 

99.times do |n|
  email = "example-#{n+1}@kento.com"
  password = "password"
  User.create email: email, password: password, password_confirmation: password
end

users = User.order(:created_at).take(6)
50.times do |n|
  title = "Example Question #{n+1}"
  views = rand(1..8)*9 || rand(8..25)*2 || rand(5..7)*3
  content = Faker::Lorem.sentence(5)
  created_at = (rand(2..15)).days.ago
  users.each { |user| user.questions.create title: title, content: content, created_at: created_at, views: views }
end
