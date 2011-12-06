require 'sinatra'
require 'sinatra/assetpack'

require 'haml'
require 'sass'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  register Sinatra::AssetPack

  assets {
    js :lib, ['/js/jquery.min.js']
    js :app, ['/js/app.js']

    css :style, ['/css/reset.css','/css/style.css']

    js_compression  :jsmin
    css_compression :sass
  }

  run! if app_file == $0
end

class App < Sinatra::Base
  get '/' do
    redirect '/welcome'
  end

  get '/favicon.ico' do
    return nil
  end

  get '/:title' do
    @title = ''
    puts request.inspect

    haml params[:title].to_sym
  end

end
