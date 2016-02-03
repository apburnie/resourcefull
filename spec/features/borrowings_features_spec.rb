require 'rails_helper'

feature 'My borrowings' do

  context 'when there are no borrowings' do
    it 'displays the logged in user doesn\'t have any borrowing ' do
      sign_up(name: 'Sara', email: 'sara@email.com')
      visit '/borrowings'
      expect(page).to have_content 'You are not currently borrowing anything'
    end
  end

  context 'when there are borrowings' do
    feature 'viewing borrowings page' do
      context 'when logged in' do
        it 'allows the user to their items on the borrowings page' do
          sign_up(name: 'Katie', email: 'katie@email.com')
          add_item(name: "POODR")
          visit '/borrowings'
          expect(page).to have_content 'POODR'
        end
      end

      context 'when logged out' do
        it 'allows the user to see the page' do
          visit '/borrowings'
          expect(page).not_to have_content 'POODR'
          expect(current_path).to eq '/users/sign_in'
        end
      end
    end
  end
end
