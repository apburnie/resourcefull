require 'rails_helper'

feature 'Items features' do

  feature 'Adding items' do
    context 'when signed in' do
      before do
        sign_up
      end

      scenario 'should display the newly added item' do
        add_item(title: "Ruby book", path: './spec/fixtures/ruby.png')
        expect(current_path).to eq '/'
        expect(page).to have_content 'Ruby book'
        expect(page).to have_css 'img'
        expect(page).to have_content 'Thanks! Your item has been added'
      end

      scenario 'should display error message if item name is too short/blak' do
        add_item(title: "bu")
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
      Item.create(name: 'POODR')
      Item.create(name: 'RSpec made Easy')
      Item.create(name: 'Angular is fun!')
    end

    scenario 'displays all items on the index page' do
      visit '/'
      expect(page).to have_content 'POODR'
      expect(page).to have_content 'RSpec made Easy'
      expect(page).to have_content 'Angular is fun!'
    end
  end
end
