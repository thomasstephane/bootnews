get '/profile/:user_id' do |user_id| 
  @user = User.find_by_id(user_id)
  
  if authenticate?(@user.id) 
    erb :profile
  else
    redirect '/'
  end
end 