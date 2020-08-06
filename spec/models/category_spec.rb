require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    described_class.new(name: 'Communication', priority: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid when name is blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid when name is not blank' do
    subject.name = 'Communication'
    expect(subject).to be_valid
  end

  it 'is invalid when priority is blank' do
    subject.priority = nil
    expect(subject).to_not be_valid
  end

  it 'is valid when priority is not blank' do
    subject.priority = 1
    expect(subject).to be_valid
  end

  it 'is invalid when name is less than 4 characters' do
    subject.name = 'a' * 3
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:articles) }
  end
end
