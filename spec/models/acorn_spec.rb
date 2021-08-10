require 'rails_helper'

RSpec.describe Acorn, type: :model do
  let(:user) { create(:user) }

  describe 'Acornのバリデーション' do
    let(:acorn) { build(:acorn, user: user) }

    context 'numberのバリデーション' do
      it 'numberが0以上の整数なら有効' do
        acorn.number = rand(0..100)
        expect(acorn).to be_valid
      end

      it 'numberが0未満なら無効' do
        acorn.number = rand(-100...0)
        expect(acorn).to be_invalid
      end
    end
  end

  describe 'userとの関係性を確認する' do
    let!(:acorn) { create(:acorn, user: user) }

    it 'userが削除されたらacornも削除される' do
      expect{ user.destroy! }.to change { Acorn.count }.from(1).to(0)
    end
  end
end
