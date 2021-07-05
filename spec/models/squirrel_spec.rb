require 'rails_helper'

RSpec.describe Squirrel, type: :model do
  let(:user) { create(:user) }

  describe '#random_friends' do
    let(:squirrel) { build(:squirrel, user: user) }

    context 'numberが1の場合' do
      it '1を返すこと' do
        squirrel.number = 1
        expect(squirrel.random_friends).to eq 1
      end
    end

    context 'numberが1の場合' do
      it '2を返すこと' do
        squirrel.number = 2
        expect(squirrel.random_friends).to eq 2
      end
    end

    context 'numberが3の場合' do
      it '3を返すこと' do
        squirrel.number = 3
        expect(squirrel.random_friends).to eq 3
      end
    end

    context 'numberが4の場合' do
      it 'ランダムで2~4の整数を返すこと' do
        squirrel.number = 4
        expect([squirrel.random_friends]).to include 2..4
      end
    end

    context 'numberが5の場合' do
      it 'ランダムで3~5の整数を返すこと' do
        squirrel.number = 5
        expect([squirrel.random_friends]).to include 3..5
      end
    end

    context 'numberが6の場合' do
      it 'ランダムで4~6の整数を返すこと' do
        squirrel.number = 6
        expect([squirrel.random_friends]).to include 4..6
      end
    end
  end



  describe 'Squirrelのバリデーション' do
    let(:squirrel) { build(:squirrel, user: user) }

    context 'numberのバリデーション' do
      it 'numberが0以上6以下の整数なら有効' do
        squirrel.number = rand(0..6)
        expect(squirrel).to be_valid
      end

      it 'numberが0未満なら無効' do
        squirrel.number = rand(-100...0)
        expect(squirrel).to be_invalid
      end

      it 'numberが7以上なら無効' do
        squirrel.number = rand(7..100)
        expect(squirrel).to be_invalid
      end
    end

    context 'total_numberのバリデーション' do
      it 'total_numberが0以上の整数なら有効' do
        squirrel.total_number = rand(0..100)
        expect(squirrel).to be_valid
      end

      it 'total_numberが0未満なら無効' do
        squirrel.total_number = rand(-100...0)
        expect(squirrel).to be_invalid
      end
    end
  end

  describe 'userとの関係性を確認する' do
    let!(:squirrel) { create(:squirrel, user: user) }

    it 'userが削除されたらsquirrelも削除される' do
      user.destroy
      expect(Squirrel.count).to eq 0
    end
  end
end
