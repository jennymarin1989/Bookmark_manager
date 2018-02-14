require 'sinatra/base'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    p ENV
    @links = Link.all
    erb :index
  end

  post '/add_link' do
    Link.add_new_link(params[:new_link])
    @links = Link.all
    erb :index
  end


  run! if app_file == $0
end
