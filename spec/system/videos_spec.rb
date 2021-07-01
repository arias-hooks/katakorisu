require 'rails_helper'

RSpec.describe "Videos", type: :system do
  let!(:user) { create(:user) }
  let!(:squirrel) { create(:squirrel, user: user) }
  let!(:acorn) { create(:acorn, user: user) }
  let!(:setting) { create(:setting, user: user) }
  let!(:activity) { create(:activity, user: user) }

  describe 'エクササイズ一覧画面', js: true do
    context 'ユーザーがログインしているとき' do
      before do
        #session[:user_id]に値を入れユーザーがログインしている状態を作る
        allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
      end

      it '一覧画面が正しく表示される' do
        visit videos_path
        expect(current_path).to eq(videos_path)
        expect(page).to have_content('エクササイズ')
        expect(page).to have_content('動画を見てどんぐりをゲットしよう！！')
        expect(page).to have_link('ストレッチ')
        expect(page).to have_link('ヨガ')
        expect(page).to have_link('筋トレ')
        expect(page).to have_link('ダンス')
      end

      context 'ストレッチをクリックしたとき' do
        it 'ストレッチ動画一覧が表示される' do
          visit videos_path
          click_link('ストレッチ')
          expect(page).to have_content('【肩甲骨ストレッチ】ガチガチに固まった首こり肩こりを解消する肩甲骨はがし｜東京新宿整体サロン')
        end
      end

      context 'ヨガをクリックしたとき' do
        it 'ヨガ動画一覧が表示される' do
          visit videos_path
          click_link('ヨガ')
          expect(page).to have_content('【不調を治す】 呼吸が深まる極上リセットヨガ☆ 肩こり、ストレス解消に効果的！ #401')
        end
      end

      context '筋トレをクリックしたとき' do
        it '筋トレ動画一覧が表示される' do
          visit videos_path
          click_link('筋トレ')
          expect(page).to have_content('自宅で出来る10分筋トレ（初級編）')
        end
      end

      context 'ダンスをクリックしたとき' do
        it 'ダンス動画一覧が表示される' do
          visit videos_path
          click_link('ダンス')
          expect(page).to have_content('【痩せるダンス】ポルノグラフィティのミュージック・アワーで家で一緒に踊ろう！！')
        end
      end
    end
    context 'ユーザーがログインしていないとき' do
      it 'トップ画面が表示される' do
        visit videos_path
        expect(current_path).to eq(top_path)
        expect(page).to have_content('肩こリス')
      end
    end
  end

  describe 'エクササイズ動画再生画面' do
    context 'ユーザーがログインしているとき' do
      before do
        #session[:user_id]に値を入れユーザーがログインしている状態を作る
        allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
        visit videos_path
        click_link('ストレッチ')
        click_on '【肩甲骨ストレッチ】ガチガチに固まった首こり肩こりを解消する肩甲骨はがし｜東京新宿整体サロン'
      end

      it '再生画面が正しく表示される' do
        expect(page).to have_content('再生する')
        expect(page).to have_content('完了する')
      end
    end
    context 'ユーザーがログインしていないとき' do
      it 'トップ画面が表示される' do
        visit videos_path(1)
        expect(current_path).to eq(top_path)
        expect(page).to have_content('肩こリス')
      end
    end
  end
end
