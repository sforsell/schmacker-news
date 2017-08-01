def logged_in?
  !!session[:user_id]
end

def current_user
  User.find_by(id: session[:user_id])
end

def require_user
  redirect "/login" unless logged_in?
end


