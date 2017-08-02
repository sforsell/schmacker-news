get "/" do
  redirect "/posts"
end

get "/posts" do
  @posts = Post.all
  erb :"/posts/index"
end

get "/posts/new" do
  require_user
  erb :"/posts/new"
end

post "/posts" do
  post = Post.new(user: current_user, title: params[:title], body: params[:body])
  if post.save
    redirect "/posts"
  else
    @errors = user.errors.full_messages
    erb :"/posts/new"
  end
end

get "/posts/:id/edit" do
  require_user
  @post = Post.find_by(id: params[:id])
  if @post.user == current_user
    erb :"/posts/edit"
  else
    redirect "/posts"
  end
end

get "/posts/:id" do
  @post = Post.find_by(id: params[:id])
  erb :"/posts/show"

end

delete "/posts/:id" do
  post = Post.find_by(id: params[:id])
  if post.user == current_user
    post.destroy
  end
  redirect "/posts"
end

put "/posts/:id" do
  post = Post.find_by(id: params[:id])
  post.title = params[:title]
  post.body = params[:body]

  if post.user == current_user && post.save
    redirect "/posts/#{post.id}"
  else
    @errors = post.errors.full_messages
    erb :"/posts/edit"
  end
end
