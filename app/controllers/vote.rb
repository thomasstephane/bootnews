post '/post/:post_id/vote' do
  if session[:user_id]
     p params
    if params[:postvote] == "Up"
      @vote = 1
    else
      @vote = -1
    end
    @post_vote = PostVote.create(user_id: session[:user_id], post_id: params[:post_id], vote: @vote)
  end
  content_type :json
  {vote: @vote}.to_json
end

post '/post/:post_id/:comment_id/vote' do |post_id, comment_id|
  if session[:user_id]
    if params[:commentvote] == "Up"
      @vote = 1
    else
      @vote = -1
    end
    @comment_vote = CommentVote.create(user_id: session[:user_id], comment_id: comment_id, vote: @vote)
  end
  content_type :json
  {vote: @vote}.to_json
end