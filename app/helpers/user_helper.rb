helpers do
  def login
    @user = User.find_by_username(params[:username])
    if @user 
      if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect "/profile/#{@user.id}"
      else
        erb :login
      end
    end
    redirect '/'
  end

  def authenticate?(user_id)
    p params
    session[:user_id] == user_id
  end
end