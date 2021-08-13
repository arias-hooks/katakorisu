require 'rails_helper'

RSpec.describe "Squirrels", type: :system do
  let!(:user) { create(:user) }
  let!(:squirrel) { create(:squirrel, user: user) }
  let!(:acorn) { create(:acorn, user: user) }
  let!(:setting) { create(:setting, user: user) }
  let!(:activity) { create(:activity, user: user) }

  describe 'ホーム画面', js: true do
    context 'ユーザーがログインしているとき' do
      before do
        # session[:user_id]に値を入れユーザーがログインしている状態を作る
        allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
      end

      it 'ホーム画面が正しく表示される' do
        visit squirrel_path
        expect(page).to have_current_path(squirrel_path, ignore_query: true)
        expect(page).to have_content('ホーム')
      end

      it '肩こリスの数が正しく表示される' do
        squirrel.update!(number: 1)
        visit squirrel_path
        expect(page).to have_selector("img[class='squirrel/1.gif']")
        expect(page).to have_content('現在1匹')
      end

      it 'どんぐりの数が正しく表示される' do
        acorn.update!(number: 1)
        visit squirrel_path
        expect(page).to have_content('× 1')
      end

      context '肩こりすが1匹以上存在し、どんぐりがあるとき' do
        before do
          squirrel.update!(number: 1)
          acorn.update!(number: 1)
        end

        it 'どんぐりをクリックすると、肩こリスにどんぐりをあげることができる' do
          visit squirrel_path
          find("img[id='acorn']").click
          expect(page).to have_content('肩こリスにどんぐりをあげますか？')
          click_on 'OK'
          sleep(1)
          expect(page).to have_selector("img[class='eat_squirrel/1.gif']")
          expect(page).to have_content('1匹の肩こリスが友達になりました！')
        end
      end

      context '肩こりすが1匹以上存在するが、どんぐりがないとき' do
        before do
          squirrel.update!(number: 1)
          acorn.update!(number: 0)
        end

        it 'どんぐりをクリックしても、肩こリスにどんぐりをあげることはできない' do
          visit squirrel_path
          find("img[id='acorn']").click
          expect(page).to have_content('今はどんぐりをあげることはできません')
        end
      end

      context 'どんぐりはあるが、肩こリスは存在しないとき' do
        before do
          squirrel.update!(number: 0)
          acorn.update!(number: 1)
        end

        it 'どんぐりをクリックしても、肩こリスにどんぐりをあげることはできない' do
          visit squirrel_path
          find("img[id='acorn']").click
          expect(page).to have_content('今はどんぐりをあげることはできません')
        end
      end
    end

    context 'ユーザーがログインしていないとき' do
      it 'トップ画面が表示される' do
        visit squirrel_path
        expect(page).to have_current_path(top_path, ignore_query: true)
        expect(page).to have_content('肩こリス')
      end
    end
  end
end
