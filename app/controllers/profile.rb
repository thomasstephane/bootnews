get '/profile/:user_id' do |user_id| 
  @user = User.find_by_id(user_id)
  erb :profile
end 