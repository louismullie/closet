get '/auth/:provider/callback' do
  auth = request.env["omniauth.auth"]
  session[:user] = User.login(auth)
  redirect '/'
end

get '/logout' do
  session[:user] = nil
  redirect '/'
end