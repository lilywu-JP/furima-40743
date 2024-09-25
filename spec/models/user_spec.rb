require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '正常系テスト' do
      expect(@user).to be_valid
    end

    it 'nicknameが必須' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが必須' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、@を含む必要がある' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力が必須' do
      @user.password = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password パスワードは半角英字と数字の両方を含めてください')
    end

    it '全角を含むパスワードでは登録できない' do
      @user.password = 'ａbcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password パスワードは半角英字と数字の両方を含めてください')
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password パスワードは半角英字と数字の両方を含めてください')
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '苗字が必須' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '名前が必須' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '苗字（カナ）が必須' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '名前（カナ）が必須' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '苗字が全角（漢字・ひらがな・カタカナ）での入力が必須' do
      @user.last_name = 'haak'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）での入力してください')
    end

    it '名前が全角（漢字・ひらがな・カタカナ）での入力が必須' do
      @user.first_name = 'abdg'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）での入力してください')
    end

    it '苗字（カナ）がカナで入力が必須' do
      @user.last_name_kana = '苗字'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana 全角（カタカナ）での入力してください')
    end

    it '名前（カナ）がカナでの入力が必須' do
      @user.first_name_kana = '名前'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角（カタカナ）での入力してください')
    end

    it '生年月日が必須' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
