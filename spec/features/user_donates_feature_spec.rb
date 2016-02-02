require 'rails_helper'

feature 'user donates an item' do
  before do
    sign_up
    add_item
  end

  it 'shows current items on the "my borrowings" page' do
    visit "/"
    click_link("My borrowings")
    expect(page).to have_content("Ruby book")
  end

  it 'shows my items on the "my borrowings" page' do
    click_link("Sign out")
    sign_up(name:"Max", email:"max@email.com")
    add_item(name:"My adventures")
    click_link("My borrowings")
    expect(page).to have_content("My adventures")
    expect(page).not_to have_content("Ruby book")
  end

end
