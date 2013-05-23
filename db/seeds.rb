10.times do |i|
  User.create(username: "dude#{i}", password: "password", email: "#{i}@mail.com")
end

20.times do |i|
  Post.create(title: "new post #{i}", url: "http://url.com/#{i}", post: "This is some big content for post #{i}", user_id: (1 + rand(10)))
end

200.times do |i|
  Comment.create(comment: "new comment #{i}", user_id: (1 + rand(20)), post_id: (1 + rand(10)))
end
