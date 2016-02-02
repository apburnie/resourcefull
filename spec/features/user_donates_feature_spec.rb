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
end
