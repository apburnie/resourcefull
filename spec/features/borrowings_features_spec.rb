require 'rails_helper'

feature 'My borrowings' do
  feature 'viewing borrowings page' do
    before do
      sign_up(name: 'Katie', email: 'katie@email.com')
      add_item(name: "POODR")
      click_link 'Sign out'
    end

    context 'when logged in' do
      xit 'allows the user to see the page' do
        sign_up(name: 'Sara', email: 'sara@email.com')
        visit '/'
        click_link "Request 'POODR'"
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
