get '/js/*.js' do |script|
  coffee script.intern
end