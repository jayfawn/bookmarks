require 'sinatra/base'
require_relative './lib/bookmark'
require_relative './database_connection_setup.rb'
require 'sinatra/flash'

class Bookmarks < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

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
    if Bookmark.validate(params[:URL])
      Bookmark.create(url: params[:URL], title: params[:title])
      redirect '/bookmarks'
    else
      flash[:error] = 'invalid url entered'
    end
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
    if Bookmark.validate(params[:url])
      Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
      redirect '/bookmarks'
    else
      flash[:error] = 'invalid url entered'
    end
  end

  get '/bookmarks/:id/comment' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :add_comment
  end

  post '/submit_comment/:id' do
    Comment.create(comment: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end
end
