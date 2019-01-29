require 'sinatra'
require './lib/bookmark.rb'

class Bookmarks < Sinatra::Base
#  disable :show_exceptions

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

post '/submit_url' do
  Bookmark.create(url: params['URL'])
  redirect '/bookmarks'
end

end
