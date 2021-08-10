require 'rails_helper'

RSpec.describe Setting, type: :model do
  let(:user) { create(:user) }
  let!(:setting) { create(:setting, user: user) }

  describe 'enum' do
    it { is_expected.to define_enum_for(:notification).with_values(off: 0, one: 1, six: 2) }
  end

  describe 'userとの関係性を確認する' do
    it 'userが削除されたらsettingも削除される' do
      expect{ user.destroy }.to change { Setting.count }.from(1).to(0)
    end
  end
end
