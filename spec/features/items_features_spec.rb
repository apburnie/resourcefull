require 'rails_helper'

feature 'Items features' do

  feature 'Adding items' do
    context 'when signed in' do
      before do
        sign_up
      end

      scenario 'should display the newly added item' do
        add_item(name: "Ruby book", path: './spec/fixtures/ruby.png')
        expect(current_path).to eq '/'
        expect(page).to have_content 'Ruby book'
        expect(page).to have_css 'img'
        expect(page).to have_content 'Thanks! Your item has been added'
      end

      scenario 'should display error message if item name is too short/blak' do
        add_item(name: "bu")
        expect(page).to have_content 'Name is too short'
      end
    end

    context 'when not signed in' do
      scenario 'should prompt the user to sign in' do
        visit '/items/new'
        expect(current_path).to eq '/users/sign_in'
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end
  end

  context 'Displaying items' do
    before do
      sign_up(name: 'Katie', email: 'katie@email.com')
      add_item(name: "POODR")
      click_link 'Sign out'
      sign_up(name: 'Sara', email: 'sara@email.com')
      add_item(name: "RSpec made Easy")
    end

    scenario 'displays all items with the name of the borrower on the index' do
      visit '/'
      expect(page).to have_content 'POODR currently with Katie'
      expect(page).to have_content 'RSpec made Easy currently with Sara'
    end
  end
end
