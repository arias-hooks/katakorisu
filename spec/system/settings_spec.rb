require 'rails_helper'

RSpec.describe "Settings", type: :system, js: true do
  let!(:user) { create(:user) }
  let!(:squirrel) { create(:squirrel, user: user) }
  let!(:acorn) { create(:acorn, user: user) }
  let!(:setting) { create(:setting, user: user) }
  let!(:activity) { create(:activity, user: user) }

  describe '通知設定' do
    before do
      # session[:user_id]に値を入れユーザーがログインしている状態を作る
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
    end

    context '通知オフに変更したとき' do
      it '通知オフに正しく変更される' do
        visit activity_path
        expect(setting.notification).to eq 'six'
        select '通知オフ', from: '通知設定'
        sleep(1)
        expect(setting.reload.notification).to eq 'off'
        expect(page).to have_content('通知オフに変更しました')
      end
    end

    context '肩こリスが1匹増えるごとに通知に変更したとき' do
      it '肩こリスが1匹増えるごとに通知に正しく変更される' do
        visit activity_path
        expect(setting.notification).to eq 'six'
        select '肩こリスが1匹増えるごとに通知', from: '通知設定'
        sleep(1)
        expect(setting.reload.notification).to eq 'one'
        expect(page).to have_content('肩こリスが1匹増えるごとに通知に変更しました')
      end
    end

    context '肩こリスが最大の6匹になったら通知に変更したとき' do
      it '肩こリスが最大の6匹になったら通知に正しく変更される' do
        setting.update!(notification: 'off')
        visit activity_path
        expect(setting.notification).to eq 'off'
        select '肩こリスが最大の6匹になったら通知', from: '通知設定'
        sleep(1)
        expect(setting.reload.notification).to eq 'six'
        expect(page).to have_content('肩こリスが最大の6匹になったら通知に変更しました')
      end
    end
  end
end
