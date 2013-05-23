# ['/post', '/post/:post_id'].each do |path|
#   before path do 
#     redirect '/' unless session[:user_id]
#   end
# end


get '/post/:post_id' do |post_id|
  @post = Post.find_by_id(post_id)
  @comments = Comment.where("post_id = ?", post_id).sort_by { |comment| - comment.score.to_i}
  @user = User.find_by_id(session[:user_id])
  @existing_post_vote = PostVote.find_by_user_id_and_post_id(session[:user_id], post_id)

  @existing_comment_vote = {}
  @comments.each do |comment|
    check = CommentVote.find_by_user_id_and_comment_id(session[:user_id], comment.id)
    if check
      @existing_comment_vote[comment.id] = false
    else
      @existing_comment_vote[comment.id] = true
    end
  end

  erb :post
end

get '/post' do
  if session[:user_id]
    @user = User.find_by_id(session[:user_id])
    erb :create_post
  else
    redirect '/login'
  end
end

post '/post' do
  if session[:user_id]
    @post = Post.create(title: params[:title], url: params[:url], post: params[:post], user_id: session[:user_id])
    redirect "/profile/#{session[:user_id]}"
  else
    redirect '/'
  end
end

post '/post/:post_id' do |post_id|
  if session[:user_id]
    @comment = Comment.create(comment: params[:comment], post_id: post_id, user_id: session[:user_id])
    redirect "/post/#{post_id}"
  else
    redirect '/'
  end
end