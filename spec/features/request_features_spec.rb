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

      it 'shows Katie made a request' do
        visit '/items'
        sign_up(email:'me@email.com', name:"Katie", password:"Secret01")
        click_link 'Request Ruby book'
        expect(page).to have_content 'Katie requested Ruby book'
        expect(page).not_to have_link 'Request Ruby book'
      end

      context 'a request has been made' do
        before do
          visit '/items'
          sign_up(email:'me@email.com', name:"Katie", password:"Secret01")
          click_link 'Request Ruby book'
          click_link "Sign out"
          log_in
        end

        it "alerts Camilla that a request has been made" do
          expect(page).to have_content("You have requests")
          expect(page).to have_link("Manage request")
        end

        it "displays pending requests on borrowings page" do
          visit('/borrowings')
          expect(page).to have_content "Katie has requested this item"
          expect(page).to have_link "Transfer item"
          expect(page).to have_link "Decline"
        end
      end

    end
  end
end
