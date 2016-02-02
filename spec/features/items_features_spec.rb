require 'rails_helper'

feature 'Items features' do
  before do
    sign_up
  end

  feature 'Adding items' do
    scenario 'should display the newly added item' do
      visit 'items/new'
      fill_in 'Name', with: 'Ruby book'
      attach_file 'Image', './spec/fixtures/ruby.png'
      click_button 'Add item'
      expect(current_path).to eq '/'
      expect(page).to have_content 'Ruby book'
      expect(page).to have_css 'img'
      expect(page).to have_content 'Thanks! Your item has been added'
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
