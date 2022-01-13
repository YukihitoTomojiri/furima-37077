require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_name_kanji、first_name_kanji、last_name_kana、first_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上あれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it '重複したemailがあれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは、@を含まなければ登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードは５文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードとパスワード（確認）は、値が一致しなければ登録できない' do
        @user.password = 'a11111'
        @user.password_confirmation = 'a22222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは半角英数字混合で入力がなければ登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '122222'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'お名前(全角)は、名字と名前が空白では登録できない' do
        @user.last_name_kanji = ''
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank", "Last name kanji can't be blank")
      end
      it 'お名前カナ(全角)は、名字と名前が空白では登録できない' do
        @user.last_name_kana = ''
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "Last name kana can't be blank")
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力がなければ登録できない' do
        @user.last_name_kanji = 'aaaaaa'
        @user.first_name_kanji = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji is invalid', 'Last name kanji is invalid')
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力がなければ登録できない' do
        @user.last_name_kana = 'あああ'
        @user.first_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid', 'Last name kana is invalid')
      end
      it 'birth_dateは空白では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
