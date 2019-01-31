require 'sinatra/base'
require_relative './lib/bookmark'
require_relative './database_connection_setup.rb'

class Bookmarks < Sinatra::Base
  enable :sessions, :method_override


  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:view)
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  get '/home' do
    redirect '/'
  end

  post '/submit_url' do
    Bookmark.create(url: params[:URL], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :update
  end

  patch '/update/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end
end
