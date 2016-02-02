require 'rails_helper'

describe 'Initial setup' do
  it 'should print items' do
    visit '/'
    expect(page).to have_content 'Items'
  end
end
