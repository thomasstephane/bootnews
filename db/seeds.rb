10.times do |i|
  User.create(username: "dude#{i}", password: "password", email: "#{i}@mail.com")
end

10.times do |i|
  Post.create(title: "new post #{i}", user_id: (1 + rand(10)))
end

10.times do |i|
  Comment.create(comment: "new comment #{i}", user_id: (1 + rand(10)), post_id: (1 + rand(10)))
end
