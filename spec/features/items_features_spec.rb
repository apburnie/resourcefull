require 'rails_helper'

describe 'Items features' do
  before do
    visit 'users/sign_up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Name', with: 'Camilla'
    fill_in 'Password', with: 'pass1234'
    fill_in 'Password confirmation', with: 'pass1234'
    click_button 'Sign up'
  end

  describe 'Adding items' do
    it 'should display the newly added item' do
      visit 'items/new'
      fill_in 'Name', with: 'Ruby book'
      click_button 'Add item'
      expect(current_path).to eq '/'
      expect(page).to have_content 'Ruby book'
      expect(page).to have_content 'Thanks! Your item has been added'
    end
  end

end
