
####### sass support ######
require 'sass'

get '/css/application.css' do
  scss :application
end



get '/' do
  @posts = Post.all.sort_by { |post| - post.score.to_i}[0..29]
  @user = User.find_by_id(session[:user_id])
  erb :index
end
