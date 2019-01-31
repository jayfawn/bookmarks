require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      add_test_bookmarks
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'should create new bookmark with a hidden link' do
      bookmark = Bookmark.create(url: 'http://wwww.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.url).to eq 'http://wwww.testbookmark.com'
      expect(bookmark.title).to eq 'Test Bookmark'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Test Bookmark', url: 'wwww.testbookmark.com')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'should update the bookmark' do
      bookmark = Bookmark.create(title: 'Test Bookmark', url: 'wwww.testbookmark.com')
      persisted_data = persisted_data(id: bookmark.id)
      Bookmark.update(id: persisted_data.first['id'], title: 'Updated Test Bookmark', url: 'wwww.updatedtestbookmark.com')
      expect(Bookmark.all.first.url).to eq 'wwww.updatedtestbookmark.com'
      expect(Bookmark.all.first.title).to eq 'Updated Test Bookmark'
    end
  end

  describe '.validate' do
    it 'should check if a correct url has been entered' do
      expect(Bookmark.validate(12345)).to eq false
      expect(Bookmark.validate('http://www.google.com')).to eq true
    end
  end
end
