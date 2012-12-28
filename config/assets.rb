require 'sinatra/assetpack'
register Sinatra::AssetPack

assets do
  serve '/css', from: 'public/css'
  serve '/img', from: 'public/img'
  
  js :vendor, '/js/vendor.js', [
    '/js/vendor/jquery.1.7.2.js',
    '/js/vendor/bootstrap.js'
  ]
  
  js :application, '/js/app.js', [
    '/js/app/*.js'
  ]

  css :application, '/css/app.css', [
    '/css/app/*.css'
  ]
    
  css :vendor, '/css/vendor.css', [
    '/css/vendor/bootstrap.css'
  ]
  
  js_compression  :uglify
  css_compression :sass
  
end