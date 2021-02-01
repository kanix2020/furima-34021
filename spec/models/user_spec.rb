require 'rails_helper'
RSpec.describe User, type: :model do
  describe '新規登録/ユーザー情報' do
    it 'emailが空では登録できない' do
      user = User.new(nick_name: 'a', email: '', password: '00000000a', password_confirmation: '00000000a', last_name: 'あ',
                      first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('Eメールを入力してください')
    end
    it 'メールアドレスが一意であること' do
      user = User.create(nick_name: 'a', email: 'test@test.com', password: '00000000a', password_confirmation: '00000000a',
                         last_name: 'あ', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: 0o000 - 0o0 - 0o0)
      another_user = FactoryBot.build(:user)
      another_user.email = user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'メールアドレスに＠が含まれていること' do
      user = User.new(nick_name: 'a', email: 'testtest.com', password: '00000000a', password_confirmation: '00000000a',
                      last_name: 'あ', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'パスワードが必須であること' do
      user = User.new(nick_name: 'a', email: 'ttest@test.com', password: '', password_confirmation: '00000000a', last_name: 'あ',
                      first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('パスワードを入力してください')
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      user = User.new(nick_name: 'a', email: 'test@test.com', password: 'a1', password_confirmation: '00000000a', last_name: 'あ',
                      first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      user = User.new(nick_name: 'a', email: 'ttest@test.com', password: '00000000', password_confirmation: '00000000a',
                      last_name: 'あ', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      user = User.new(nick_name: 'a', email: 'ttest@test.com', password: '00000000a', password_confirmation: '', last_name: 'あ',
                      first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      user = User.new(nick_name: 'a', email: 'ttest@test.com', password: '00000000a', password_confirmation: '00000000b',
                      last_name: 'あ', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
  end
  describe '新規登録/本人情報確認' do
    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      user = User.new(nick_name: 'a', email: 'ttest@test.com', password: '00000000a', password_confirmation: '00000000a',
                      last_name: '', first_name: '', last_name_kana: 'ア', first_name_kana: 'ア', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('苗字を入力してください', '名前を入力してください')
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      user = User.new(nick_name: 'a', email: 'ttest@com', password: '00000000a', password_confirmation: '00000000a',
                      last_name: 'a', first_name: 'a', last_name_kana: 'ア', first_name_kana: 'ア', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('苗字は全角で入力してください', '名前は全角で入力してください')
    end
    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
      user = User.new(nick_name: 'a', email: 'ttest@test.com', password: '00000000a', password_confirmation: '00000000a',
                      last_name: 'あ', first_name: 'あ', last_name_kana: '', first_name_kana: '', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('苗字(カナ)を入力してください', '名前(カナ)を入力してください')
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      user = User.new(nick_name: 'a', email: 'ttest@test.com', password: '00000000a', password_confirmation: '00000000a',
                      last_name: 'あ', first_name: 'あ', last_name_kana: 'あ', first_name_kana: 'あ', birthday: 0o000 - 0o0 - 0o0)
      user.valid?
      expect(user.errors.full_messages).to include('苗字(カナ)は全角カタカナで入力してください', '名前(カナ)は全角カタカナで入力してください')
    end
    it '生年月日が必須であること' do
      user = User.new(nick_name: 'a', email: 'ttest@test.com', password: '00000000a', password_confirmation: '00000000a',
                      last_name: 'あ', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include('誕生日を入力してください')
    end
  end
end
