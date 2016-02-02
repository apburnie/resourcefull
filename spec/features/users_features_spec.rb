require 'rails_helper'

describe 'Initial setup' do
  it 'should print items' do
    visit '/'
    expect(page).to have_content 'Items'
  end
end

feature 'User sessions' do

  context 'Signing up' do
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

  context 'when signed in' do
    before do
      sign_up
    end

    it'should allow a user to sign out' do
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'Log in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end
  end


end
