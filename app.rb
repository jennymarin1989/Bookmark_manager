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
    begin
      Link.add_new_link(params[:new_link],params[:title])
      redirect '/'
    rescue Exception => error
      flash[:notice] = error.message
    end
    redirect('/add_link')
  end

  get '/delete_link' do
    erb :delete_link
  end

  post '/delete_link' do
    begin
    Link.delete_link(params[:title])
    redirect '/'
  rescue Exception => error
    flash[:notice] = error.message
  end
  redirect '/delete_link'
end

  get '/update_link' do
    erb :update_link
  end

  post '/update_link' do
    Link.update_link(params[:title], params[:new_title], params[:new_url])
    redirect '/'
  end

  run! if app_file == $0
end
