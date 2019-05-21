require 'rails_helper'

feature 'キモチ管理機能' do
  let!(:user_having_emotions) { create(:user, id: 1, name:'ゲスト1', email: 'aaa@example.com', password: 'password') }
  let!(:user_having_no_emotion) { create(:user, id: 2, name:'ゲスト2', email: 'bbb@example.com', password: 'password') }
  background do
    3.times do |i|
      create(:emotion, name:i.to_s, user_id: 1)
    end
  end

  feature '一覧機能' do
    background do
      log_in_as log_in_user
      visit emotions_path
    end

    context 'emotionを3つ登録したユーザでログインしたとき' do
      let(:log_in_user){ user_having_emotions }

      scenario 'indexページでキモチ一覧が表示される' do
        expect(page).to have_selector '.emotion', count: 3
      end

      scenario '削除ボタンを押して、ボタンに対応したキモチが削除される' do
        expect{click_link '削除', href:'/emotions/1'}.to change{ Emotion.count }.by(-1)
        expect(page).to have_content '削除しました。'
      end
    end

    context 'emotionを全く登録していないユーザでログインしたとき' do
      let(:log_in_user){ user_having_no_emotion }

      scenario 'indexページでキモチ一覧が表示されない（ゲスト1の内容が表示されない）' do
        expect(user_having_emotions.emotions.count).to eq 3
        expect(page).to have_selector '.emotion', count: 0
      end

      scenario 'emotionが無いので、新規登録を促す文が表示される' do
        expect(log_in_user.emotions.count).to eq 0
        expect(page).to have_selector '#introduce-create-emotion'
      end
    end
  end

  feature "新規作成機能" do
    background do
      log_in_as user_having_no_emotion
    end

    scenario 'newページでフォームに入力しpostしindexページにリダイレクト' do
      visit new_emotion_path
      fill_in name:'emotion[name]', with: 'test'
      click_button '作成'
      expect(current_path).to eq emotions_path
      expect(user_having_no_emotion.emotions.count).to eq 1
      expect(page).to have_content '新しいキモチを登録しました。'
    end
  end
end
