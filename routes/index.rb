get "/" do
  @title = 'It works!'
  haml :index
end