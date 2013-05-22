helpers do
  def login
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      redirect "/profile/#{@user.id}"
    else
      erb :login
    end
  end
end