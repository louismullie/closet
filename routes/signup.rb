get "/signup" do
  haml :signup
end

post '/signup' do
  u = User.create(
    name: 'louis',
    email: 'louis.mullie@gmail.com',
  )
end