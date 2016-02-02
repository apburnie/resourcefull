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
      sign_up
      expect(current_path).to eq '/'
      expect(page).to have_content 'Welcome'
    end

    it 'should save a signed up user to the database' do
      sign_up
      expect(User.first.name).to have_content 'Camilla'
    end
  end

  describe 'signing out' do
    it'should allow a user to sign out' do
      sign_up
      click_button 'Sign out'
    end
  end
end
