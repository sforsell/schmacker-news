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
  end

end

get "/users/:id/posts" do
  "all of 1 users posts"
end

get "/users/:id/comments" do
  "all of 1 users comments"
end

delete "/user/:id" do
  "deletes user account"
end

get "/login" do
  erb :"/users/login"
end

post "/login" do
  "starts a session"
end

get "/logout" do
  "clears user sesh"
end
