require 'rails_helper'

RSpec.describe List, :type => :model do
  describe '#invite' do
    let(:user) do
      user = User.create(email: 'aa@bb.com')
      user.save(validate: false)
      user
    end

    let(:list1) { List.create(name: 'First List') }

    subject { list1.invite(user) }

    context 'user can be invited' do
      it 'add list to user lists' do
        expect{subject}.to change{user.lists.count}.by(1)
      end
    end

    context 'if user already invited' do
      before { user.lists << list1 }

      it "don't list to user lists" do
        expect{subject}.to change{user.lists.count}.by(0)
      end
    end
  end
end
