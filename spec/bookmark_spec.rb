require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'www.makersacademy.com'
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
    expect(Bookmark.all.length).to eq 3
  end
end
end
