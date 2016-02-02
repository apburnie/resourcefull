require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is not valid if the name is less than 3 characters' do
    item = Item.new(name: 'ok')
    expect(item).to have(1).error_on(:name)
    expect(item).not_to be_valid
  end
 end
