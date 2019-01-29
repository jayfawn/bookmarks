def setup_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('TRUNCATE TABLE bookmarks')
end

def add_test_bookmarks
  Bookmark.create(url: 'http://www.makersacademy.com')
  Bookmark.create(url: 'http://www.destroyallsoftware.com')
  Bookmark.create(url: 'http://www.google.com')
end
