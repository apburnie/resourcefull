require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is not valid if the name is less than 3 characters' do
    item = Item.new(name: 'ok')
    expect(item).to have(1).error_on(:name)
    expect(item).not_to be_valid
  end

  it 'is not valid if the name is blank' do
    item = Item.new(name: '')
    expect(item).to have(2).error_on(:name)
    expect(item).not_to be_valid
  end

  describe '#build_with_user' do
    let(:user) { User.create email: 'test@test.com' }
    let(:item) { Item.create name: 'My nice book' }

    it 'builds an item' do
      expect(item).to be_a Item
    end

    it 'builds an item associated with the specified user' do
      expect(item.user_id).to eq user.id
    end
  end

  describe '#current_borrower' do
    let(:user) { User.create name: 'sara', email: 'test@test.com',
                              password: 'password', password_confirmation: 'password' }
    let(:item) { Item.create name: 'My nice book', user_id: user.id  }

    it 'should return the name of the initial borrower' do
      expect(item.current_borrower).to eq 'sara'
    end
  end

 end
