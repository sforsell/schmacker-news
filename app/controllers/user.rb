get "/users/new" do
  erb :"/users/register"
end

post "/users" do
  user = User.new(username: params[:username], password: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect "/posts"
  else
    @errors = user.errors.full_messages
    erb :"/users/register"
  end

end

get "/users/:id/posts" do
  erb :"/users/show_posts"
end

get "/users/:id/comments" do
  erb :"/users/show_comments"
end

delete "/user/:id" do
  "deletes user account"
end

get "/login" do
  erb :"/users/login"
end

post "/login" do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/posts"
  else
    @errors = ["something went wrong. So wrong!"]
  end
end

get "/logout" do
  session.clear
  redirect "/posts"
end
