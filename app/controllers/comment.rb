post "/posts/:id/comments" do
  comment = Comment.new(text: params[:text], post_id: params[:id], user: current_user)
  if comment.save
    redirect "/posts/#{params[:id]}"
  else
    comment.errors.full_messages
  end
end

get "/posts/:post_id/comments/:comment_id/edit" do
  require_user
  @comment = Comment.find_by(id: params[:comment_id])
  erb :"/comments/edit"
end

put "/posts/:post_id/comments/:id" do
  # Comment.update(params[:id], text: params[:text]);
  comment = Comment.find_by(id: params[:id])
  comment.text = params[:text]

  if comment.save
    redirect "/posts/#{params[:post_id]}"
  else
    @errors = comment.errors.full_messages
    erb :"/comments/edit"
  end
  # <form class="right-align col s1" action="/posts/<%=@post.id%>/comments" method"">
end

delete "/posts/:post_id/comments/:id" do
  Comment.find_by(id: params[:id]).destroy
  redirect "/posts/#{params[:post_id]}"
end

