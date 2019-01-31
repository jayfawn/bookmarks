require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: "https://www.makersacademy.com")
    expect(page).to have_link('Destroy software', href: "https://www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "https://www.google.com")
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
    fill_in('URL', with: 'www.github.com')
    fill_in('title', with: 'Github')
    click_button('Submit')
    expect(page).to have_link('Github', href: 'https://www.github.com')
  end
end
