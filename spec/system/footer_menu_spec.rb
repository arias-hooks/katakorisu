require 'rails_helper'

RSpec.describe "FooterMenu", type: :system do
  let!(:user) { create(:user) }
  let!(:squirrel) { create(:squirrel, user: user) }
  let!(:acorn) { create(:acorn, user: user) }
  let!(:setting) { create(:setting, user: user) }
  let!(:activity) { create(:activity, user: user) }

  before do
    #session[:user_id]に値を入れユーザーがログインしている状態を作る
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
  end

  describe 'フッターメニュー', js: true do
    context 'ホームをクリックしたとき' do
      it 'ホーム画面が正しく表示される' do
        visit videos_path
        within 'nav' do
          click_on 'ホーム'
        end
        expect(current_path).to eq(squirrel_path)
        expect(page).to have_content('ホーム')
      end
    end

    context 'エクササイズをクリックしたとき' do
      it 'エクササイズ画面が正しく表示される' do
        visit squirrel_path
        within 'nav' do
          click_on 'エクササイズ'
        end
        expect(current_path).to eq(videos_path)
        expect(page).to have_content('エクササイズ')
      end
    end

    context 'アクティビティをクリックしたとき' do
      it 'アクティビティ画面が正しく表示される' do
        visit squirrel_path
        within 'nav' do
          click_on 'アクティビティ'
        end
        expect(current_path).to eq(activity_path)
        expect(page).to have_content('アクティビティ')
      end
    end
  end
end
