require 'rails_helper'


feature 'セッション管理機能' do
  feature 'ログイン機能' do
    background do
      user = create(:user, id: 1, name:'ゲスト', email: 'aaa@example.com', password: 'password')
      log_in_as user
    end

    context '有効な情報を入力したとき' do
      let(:email){ 'aaa@example.com' }
      let(:password){ 'password' }
      scenario 'ログインしてemotion#indexを開く' do
        expect(current_path).to eq emotions_path
      end

      feature 'ログアウト機能' do
        scenario 'ログアウトボタンがあって、ログアウトする' do
          expect(page).to have_content 'ログアウト'
          click_link 'ログアウト'
          expect(current_path).to eq root_path
        end
      end

    end

    context '無効な情報を入力したとき' do
      let(:email){ 'bbb@example.com' }
      let(:password){ 'password' }
    end
  end

end