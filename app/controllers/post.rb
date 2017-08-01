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

get "/posts/:id" do
  @post = Post.find_by(id: params[:id])
  erb :"/posts/show"

end

delete "/post/:id" do
  "remove post from db"
end

put "/post/:id" do
  "update post"
end
