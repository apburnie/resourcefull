require 'rails_helper'

feature 'Request items' do
  context 'when signed in' do
    before do
      sign_up
      add_item
      click_link 'Sign out'
    end

    feature 'making a request' do
      it 'shows a Request link' do
        visit '/items'
        sign_up(email:'me@email.com', name:"Katie", password:"Secret01")
        expect(current_path).to eq '/'
        expect(page).to have_content 'Ruby book'
        expect(page).to have_link 'Request Ruby book'
      end

      xit 'shows Katie made a request' do
        visit '/items'
        sign_up(email:'me@email.com', name:"Katie", password:"Secret01")
        click_link 'Request'
        expect(page).to have_content 'KRuby book'
      end
    end
  end
end
