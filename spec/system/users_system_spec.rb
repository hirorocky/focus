require 'rails_helper'

feature 'ユーザー管理機能' do
  feature 'ユーザー新規登録' do
    background do
      visit new_user_path
      fill_in name:'user[email]', with: email
      fill_in name:'user[password]', with: password
      fill_in name:'user[password_confirmation]', with: password_confirmation
      click_button '登録する'
    end

    context '登録する情報が有効な場合' do
      let(:email){ 'aaa@example.com' }
      let(:password){ 'password' }
      let(:password_confirmation){ 'password' }
      scenario 'ユーザー新規作成、(ログインして)emotions#indexに飛ぶ' do
        expect(current_path).to eq emotions_path
        #TODO: expect(logged_in?).to be_truthy
        expect(User.find_by(email:email)).to be_truthy
      end
    end

    context '登録する情報が無効な場合' do
      let(:email){ '@example.com' } # 無効なアドレス
      let(:password){ 'pass' } # 無効なパスワード
      let(:password_confirmation){ 'a' } # 確認パスワードが一致しない
      scenario '新規登録ページを再表示して、警告が出る' do
        expect(current_path).to eq new_user_path
        expect(page).to have_selector '.error-message', count: 3
      end
    end
  end
end