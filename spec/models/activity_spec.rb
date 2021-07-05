require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:user) { create(:user) }

  describe 'Activityのバリデーション' do
    let(:activity) { build(:activity, user: user) }

    context 'video_viewsのバリデーション' do
      it 'video_viewsが0以上の整数なら有効' do
        activity.video_views = rand(0..100)
        expect(activity).to be_valid
      end

      it 'video_viewsが0未満なら無効' do
        activity.video_views = rand(-100...0)
        expect(activity).to be_invalid
      end
    end

    context 'video_viewing_timeのバリデーション' do
      it 'video_viewing_timeが0以上の整数なら有効' do
        activity.video_viewing_time = rand(0..100)
        expect(activity).to be_valid
      end

      it 'video_viewing_timeが0未満なら無効' do
        activity.video_viewing_time = rand(-100...0)
        expect(activity).to be_invalid
      end
    end
  end

  describe 'userとの関係性を確認する' do
    let!(:activity) { build(:activity, user: user) }

    it 'userが削除されたらactivityも削除される' do
      user.destroy
      expect(Activity.count).to eq 0
    end
  end
end
