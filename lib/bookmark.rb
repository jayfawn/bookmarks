require 'pg'
require_relative 'database_helpers.rb'
require_relative 'database_connection'

class Bookmark

  def self.all
    select_connection
    result = DBConn.query('SELECT * FROM bookmarks')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    select_connection
    result = DBConn.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    select_connection
    DBConn.query("DELETE from bookmarks where id =('#{id}')")
  end

  def self.update(id:, url:, title:)
    select_connection
    result = DBConn.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    select_connection
    result = DBConn.query("SELECT * FROM bookmarks WHERE id = #{id}")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  attr_reader :url, :title, :id

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end
end
