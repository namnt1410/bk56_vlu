User.create email: "namnt.1410@gmail.com", password: "12345678", password_confirmation: "12345678" 

99.times do |n|
  email = "example-#{n+1}@kento.com"
  password = "password"
  User.create email: email, password: password, password_confirmation: password
end

users = User.order(:created_at).take(6)
50.times do |n|
  title = "Example Question #{n+1}"
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.questions.create title: title, content: content }
end
