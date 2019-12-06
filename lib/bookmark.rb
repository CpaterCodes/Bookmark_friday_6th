require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize (id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end


  def self.all
    #the if statement below tells the class which db to use when connecting
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      #using pg to connect to prod database
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    #running a query on the connection previously established
    result = connection.exec("SELECT * FROM bookmarks;")
    #assign that to a result variable and map over it to return the details:
    #it wraps up a row in the bookmarks table in an array object. the whole table becomes an array of arrays.
    result.map { |bookmark| Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title']) }
  end


  def self.create(url:, title:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}','#{title}') RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
  end
end
