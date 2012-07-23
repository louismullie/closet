def login(auth)
  session[:user] = {
    id: auth['uid'],
    name: auth.info.name
  }
end

post '/auth/twitter/callback' do
  if login(request.env['omniauth.auth'])
    redirect '/'
  else
    redirect '/login?msg=failed'
  end
end

post '/auth/facebook/callback' do
  login request.env['omniauth.auth']
  redirect '/'
end

post '/auth/google/callback' do
  login request.env['omniauth.auth']
  redirect '/'
end

post '/auth/developer/callback' do
  if login(request.env['omniauth.auth'])
    redirect '/'
  else
    redirect '/login?msg=failed'
  end
end