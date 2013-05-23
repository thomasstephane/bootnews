User.create(username: "Adam", password: "password", email: "adam.sartell@gmail.com")
User.create(username: "Allen", password: "password", email: "allen@quantma.com")
User.create(username: "Dexter", password: "password", email: "dvubox@gmail.com")
User.create(username: "Ben", password: "password", email: "benjamin.b2@gmail.com")
User.create(username: "Stephan", password: "password", email: "thomas.stephn@gmail.com")
User.create(username: "Nate", password: "password", email: "nathanielwroblewski@gmail.com")
User.create(username: "Ken", password: "password", email: "kenrettberg@gmail.com")
User.create(username: "Robert", password: "password", email: "robertjoonkim@gmail.com")
User.create(username: "Yaron", password: "password", email: "ysadka@gmail.com")
User.create(username: "Travis", password: "password", email: "travis.lawrence12@gmail.com")


20.times do |i|
  Post.create(title: "new post #{i}", url: "http://url.com/#{i}", post: "This is some big content for post #{i}", user_id: (1 + rand(10)))
end

200.times do |i|
  Comment.create(comment: "new comment #{i}", user_id: (1 + rand(10)), post_id: (1 + rand(10)))
end
