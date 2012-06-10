get '/css/*.css' do |stylesheet|
  sass stylesheet.intern
end