require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end

feature 'Adding bookmarks' do
  scenario 'A user can add a bookmark' do
    visit('/')
    click_link('Add a bookmark')
    expect(page).to have_content "Please enter the URL below:"
  end

  scenario 'A user can add a bookmark' do
    visit('/')
    click_link('Add a bookmark')
    fill_in('URL', :with => 'http://www.github.com')
    click_button('Submit')
    expect(page).to have_content "http://www.github.com"
  end
end
