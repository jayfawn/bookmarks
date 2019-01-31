require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    add_test_bookmarks
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: "www.makersacademy.com")
    expect(page).to have_link('Destroy software', href: "www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "www.google.com")
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
    fill_in('URL', with: 'https://www.github.com')
    fill_in('title', with: 'Github')
    click_button('Submit')
    expect(page).to have_link('Github', href: 'https://www.github.com')
  end

  scenario 'an error is shown in the event of an invalid url' do
    visit('/')
    click_link('Add a bookmark')
    fill_in('URL', with: 'hwww.githubcom')
    fill_in('title', with: 'Github')
    click_button('Submit')
    expect(page).to have_content "invalid url entered"
  end
end
