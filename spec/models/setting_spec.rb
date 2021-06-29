require 'rails_helper'

RSpec.describe Setting, type: :model do
  let(:user) { create(:user) }
  let!(:setting) { build(:setting, user: user) }

  describe 'enum' do
    it { is_expected.to define_enum_for(:notification).with_values(off: 0, one: 1, six: 2) }
  end

  describe 'userとの関係性を確認する' do
    it 'userが削除されたらactivityも削除される' do
      user.destroy
      expect(Activity.count).to eq 0
    end
  end
end
