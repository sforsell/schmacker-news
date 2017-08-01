get "/" do
  redirect "/posts"
end

get "/posts" do
  @posts = Post.all
  erb :"/posts/index"
end

get "/posts/new" do
  erb :"/posts/new"
end

post "/posts/new" do
  "add post do db"
end

get "/posts/:id" do
  "show one post with all its comments + have form to add comment"
end

delete "/post/:id" do
  "remove post from db"
end

put "/post/:id" do
  "update post"
end
