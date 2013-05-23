
####### sass support ######
require 'sass'

get '/css/application.css' do
  scss :application
end



get '/' do
  @posts = Post.all.sort_by { |post| - post.score.to_i}[0..29]
  @existing_post_vote = {}
  @posts.each do |post|
    check = PostVote.find_by_user_id_and_post_id(session[:user_id], post.id)
    if check
      @existing_post_vote[post.id] = false
    else
      @existing_post_vote[post.id] = true
    end
  end
  @user = User.find_by_id(session[:user_id])
  erb :index
end
