helper do

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      # give_token
    else
      # redirect_to home_url
    end
  end
end