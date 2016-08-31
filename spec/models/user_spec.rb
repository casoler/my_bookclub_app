require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it 'should save the user' do
      user = User.new(
        first_name: 'Bob',
        last_name: 'Test',
        email: 'bob@bob.com',
        zip_code: 60018,
        password: 'password'
      )
      expect(user.save).to eq(true)
    end

    it 'should not save the user' do
      user = User.new(
        first_name: 'Bob',
        last_name: 'Test',
        email: 'bob@bob.com',
        password: 'password'
      )
      expect(user.save).to eq(false)
    end
  end
end
