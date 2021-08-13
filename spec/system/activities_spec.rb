require 'rails_helper'

RSpec.describe "Activities", type: :system do
  let!(:user) { create(:user) }
  let!(:squirrel) { create(:squirrel, user: user) }
  let!(:acorn) { create(:acorn, user: user) }
  let!(:setting) { create(:setting, user: user) }
  let!(:activity) { create(:activity, user: user) }

  describe 'アクティビティ画面', js: true do
    context 'ユーザーがログインしているとき' do
      before do
        # session[:user_id]に値を入れユーザーがログインしている状態を作る
        allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
      end

      it 'アクティビティ画面が正しく表示される' do
        visit activity_path
        expect(page).to have_current_path(activity_path, ignore_query: true)
        expect(page).to have_content('アクティビティ')
      end

      it '友だちになった肩こリスの数が正しく表示される' do
        squirrel.update!(total_number: 1)
        visit activity_path
        expect(page).to have_selector '#total_number', text: '1匹'
      end

      it '動画の視聴数が正しく表示される' do
        activity.update!(video_views: 1)
        visit activity_path
        expect(page).to have_selector '#video_views', text: '1本'
      end

      it 'エクササイズ時間が正しく表示される' do
        activity.update!(video_viewing_time: 60)
        visit activity_path
        expect(page).to have_selector '#video_viewing_time', text: '1分'
      end
    end

    context 'ユーザーがログインしていないとき' do
      it 'トップ画面が表示される' do
        visit activity_path
        expect(page).to have_current_path(top_path, ignore_query: true)
        expect(page).to have_content('肩こリス')
      end
    end
  end
end
