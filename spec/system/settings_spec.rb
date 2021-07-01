require 'rails_helper'

RSpec.describe "Settings", type: :system do
  let!(:user) { create(:user) }
  let!(:squirrel) { create(:squirrel, user: user) }
  let!(:acorn) { create(:acorn, user: user) }
  let!(:setting) { create(:setting, user: user) }
  let!(:activity) { create(:activity, user: user) }

  describe '通知設定', js: true do
    before do
      #session[:user_id]に値を入れユーザーがログインしている状態を作る
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
    end

    context '通知オフに変更したとき' do
      it '通知オフに正しく変更される' do
        visit activity_path
        expect(page).to have_select('通知設定', selected: '肩こリスが最大の6匹になったら通知')
        select '通知オフ', from: '通知設定'
        sleep(2)
        visit current_path
        expect(page).to have_select('通知設定', selected: '通知オフ')
      end
    end

    context '肩こリスが1匹増えるごとに通知に変更したとき' do
      it '肩こリスが1匹増えるごとに通知に正しく変更される' do
      end
    end

    context '肩こリスが最大の6匹になったら通知に変更したとき' do
      it '肩こリスが最大の6匹になったら通知に正しく変更される' do
      end
    end
  end
end
