require 'pg'
require_relative 'database_connection'

def setup_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('TRUNCATE TABLE bookmarks, comments')
end

def add_test_bookmarks
  Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
  Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy software')
  Bookmark.create(url: 'http://www.google.com', title: 'Google')
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.query("Select * FROM bookmarks where id = #{id};")
end

def setup_connection
  if ENV['ENVIRONMENT'] == 'test'
    conn = PG.connect(dbname: 'bookmark_manager_test')
  else
    conn = PG.connect(dbname: 'bookmark_manager')
  end
end
