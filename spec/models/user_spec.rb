require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it '全ての情報が正しく入力された場合、ユーザー登録が成功する' do
        @user = FactoryBot.build(:user)
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない時' do
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
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'kana_last_nameが空では登録できない' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana last name can't be blank"
    end
    it 'kana_first_nameが空では登録できない' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana first name can't be blank"
    end
    it 'birthが空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
    end
    it 'メールアドレスに@が含まれていない場合、登録できない' do
      @user = FactoryBot.build(:user, email: 'testexample.com')
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    
    it 'パスワードが5文字以下であれば、登録できない' do
      @user = FactoryBot.build(:user, password: '12345', password_confirmation: '12345')
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    
    it 'パスワードが数字のみの場合、登録できない' do
      @user = FactoryBot.build(:user, password: '123456', password_confirmation: '123456')
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
    
    it 'パスワードが文字のみの場合、登録できない' do
      user = FactoryBot.build(:user, password: 'abcdef', password_confirmation: 'abcdef')
      user.valid?
      expect(user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end

    it 'パスワードが全角文字を含む場合、登録できない' do
      @user = FactoryBot.build(:user, password: 'ｐａｓｓｗｏｒｄ１２３', password_confirmation: 'ｐａｓｓｗｏｒｄ１２３')
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end

    it 'パスワードが半角英数字混合でない場合、登録できない' do
      @user = FactoryBot.build(:user, password: '123456', password_confirmation: '123456')
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
    
    it 'パスワードとパスワード（確認用）が一致しなければ、登録できない' do
      @user = FactoryBot.build(:user, password: '123456', password_confirmation: '654321')
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it '全角の名前（last_name）でなければ、登録できない' do
      @user = FactoryBot.build(:user, last_name: 'yamada')
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
    end
    
    it '全角の名前（first_name）でなければ、登録できない' do
      @user = FactoryBot.build(:user, first_name: 'tarou')
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
    end
    
    it '全角カナの名前（kana_last_name）でなければ、登録できない' do
      @user = FactoryBot.build(:user, kana_last_name: 'やまだ')
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana last name is invalid. Input full-width katakana characters')
    end
    
    it '全角カナの名前（kana_first_name）でなければ、登録できない' do
      @user = FactoryBot.build(:user, kana_first_name: 'たろう')
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name is invalid. Input full-width katakana characters')
    end
  end
end    
end