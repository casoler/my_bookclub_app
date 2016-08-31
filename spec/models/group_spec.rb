require 'rails_helper'

RSpec.describe Group, type: :model do
  describe ''
  describe 'add_member' do
    it 'should add a new member to the group' do
      @group = Group.new(name: 'test')
      @group.save

      @user = User.new(
        first_name: 'Bob',
        last_name: 'Test',
        email: 'bob@bob.com',
        zip_code: 60018)
      @user.save

      expect(@group.add_member({user_id: @user.id, leader_flag: false})).to eq(true)
    end
  end
  
end
