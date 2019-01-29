def setup_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('TRUNCATE TABLE bookmarks')
end

def add_test_bookmarks
  p '1'
  Bookmark.create(url: 'http://www.makersacademy.com')
  p '2'
  Bookmark.create(url: 'http://www.destroyallsoftware.com')
  p '3'
  Bookmark.create(url: 'http://www.google.com')
  p '4'
end
