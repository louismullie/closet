get "/" do
  @title = t :title
  haml :index
end