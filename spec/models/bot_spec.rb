require 'rails_helper'

RSpec.describe Bot, type: :model do
  before :each do
    @bot = Bot.create()
  end

  it 'should validate name' do
    expect(@bot.errors[:name]).to_not be_empty
  end

  it 'should validate age' do
    expect(@bot.errors[:age]).to_not be_empty
  end
  it 'should validate weight' do
    expect(@bot.errors[:weight]).to_not be_empty
  end

  it 'should validate enjoys' do
    expect(@bot.errors[:enjoys]).to_not be_empty
  end

  it 'should validate image' do
    expect(@bot.errors[:image]).to_not be_empty
  end

  it 'should validate enjoys is greater or equal to 10' do
    @bot = Bot.create(enjoys: 'nothing')
    expect(@bot.errors[:enjoys]).to_not be_empty
  end
end