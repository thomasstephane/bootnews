get '/' do
  @posts = Post.all
  @user = User.find_by_id(session[:user_id])
  erb :index
end
