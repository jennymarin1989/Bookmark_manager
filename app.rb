require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add_link' do
    erb :add_new_links
  end

  post '/create_new_link' do
    # redirect '/' if Link.add_new_link(params[:new_link])
    # flash[:error] = "This is not a link"
    flash[:notice] = "You must submit a valid URL." unless Link.add_new_link(params[:new_link])
    redirect('/')
  end

  run! if app_file == $0
end
