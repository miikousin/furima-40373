require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、birth_day、last_name、first_name、last_kana、first_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '222222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")    
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は英数字含めて設定してください。")
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は英数字含めて設定してください。")
    end
    it 'passwordが全角では登録できない' do
      @user.password = "ＡＡＡ１１１"
      @user.password_confirmation = 'ＡＡＡ１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は英数字含めて設定してください。")
    end
    it '重複したemailが存在すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが半角では登録できない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角で入力してください")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが半角では登録できない' do
      @user.first_name = 'hanako'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください")
    end
    it 'last_kanaが空では登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end
    it 'last_kanaが半角では登録できない' do
      @user.last_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana は全角カタカナで入力して下さい。")
    end
    it 'last_kanaにカタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できない' do
      @user.last_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana は全角カタカナで入力して下さい。")
    end
    it 'first_kanaが空では登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end
    it 'first_kanaが半角では登録できない' do
      @user.first_kana = 'hanako'
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana は全角カタカナで入力して下さい。")
    end
    it 'first_kanaにカタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できない' do
      @user.first_kana = 'はなこ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana は全角カタカナで入力して下さい。")
    end
  end
  end
end
