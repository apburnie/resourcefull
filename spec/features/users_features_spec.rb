require 'rails_helper'

describe 'Initial setup' do
  it 'should print items' do
    visit '/'
    expect(page).to have_content 'Items'
  end
end

describe 'User sessions' do

  describe 'Signing up' do
    # As a user,
    # so that I can see who has the item I am interested in,
    # I need to sign up to the website
    it 'should allow a user to sign up with email, full name, password' do
      visit 'users/sign_up'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Name', with: 'Camilla'
      fill_in 'Password', with: 'pass1234'
      fill_in 'Password confirmation', with: 'pass1234'
      click_button 'Sign up'
      expect(current_path).to eq '/'
      expect(page).to have_content 'Welcome'
    end
  end

end
