require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    # p ENV
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get'/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'], title: params['title'])
    # redirect to the homepage
    redirect '/bookmarks'
  end


  run! if app_file == $0

end
