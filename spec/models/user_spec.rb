require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate' do
    let(:password){ 'a' * 6 }
    let(:email){ 'aaa@example.com' }
    let(:user){ build(:user, password: password,
                             password_confirmation: password,
                             email: email)}
    subject { user }

    shared_examples 'ユーザーは有効' do
      it { is_expected.to be_valid }
    end
    shared_examples 'ユーザーは無効' do
      it { is_expected.not_to be_valid }
    end

    context 'すべて正しい属性のとき' do
      let(:password){ 'a' * 6 }
      let(:email){ 'aaa@example.com' }
      it_behaves_like 'ユーザーは有効'
    end

    ['a' * 5, # 5文字以下
     ""       # 空白
    ].each do |pass|
      context '誤ったパスワードのとき' do
        let(:password){ pass }
        it_behaves_like 'ユーザーは無効'
      end
    end

    [ 'aaa.bbb',           # @がない
      'aaa@aaa',           # .がない
      '@aaa.bbb',          # @以前がない
      'aa.a@',             # @以降がない
      'a'*193 + '@aaa.com' # 201文字以上
    ].each do |e|
      context '誤ったメールアドレスのとき' do
        let(:email){ e }
        it_behaves_like 'ユーザーは無効'
      end
    end
  end
end
