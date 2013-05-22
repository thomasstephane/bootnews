get '/login' do
  
  erb :login
end

post '/login' do
  login
end

get '/logout' do 
  session.clear
  redirect '/'
end

get '/signup' do 
  erb :signup
end

post '/signup' do
  @user = User.find_by_username(params[:username])
  if !@user
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
  end
  login
end
