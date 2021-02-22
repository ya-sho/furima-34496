require 'rails_helper'
RSpec.describe User, type: :model do
  before do 
    @user=FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
   context 'ユーザー情報' do 
    it 'nicknameが空だと登録できない' do
      @user.nickname=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameを入力してください")
    end
    it 'emailに一意性がなければでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it 'emailが空では登録できない' do
      @user.email=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'emailが@がないと登録できない' do 
      @user.email='abcabc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it 'passwordが空だと登録できない' do 
      @user.password=''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordが6文字より少ないと登録できない' do 
      @user.password="22222"
      @user.valid?
      expect(@user.errors.full_messages).to include( "パスワードは6文字以上で入力してください")
    end
    it 'passwordが半角数字のみでは登録できない' do 
      @user.password= "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include( "パスワードは不正な値です")
    end
    it 'passwordが半角英字のみでは登録できない' do 
      @user.password= "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    it 'password_confirmationが空だと登録できない' do 
      @user.password_confirmation=''
      @user.valid?
      expect(@user.errors.full_messages).to include( "パスワード（確認用）を入力してください")
    end  
    it 'passwordとpassword_confirmationは同じでないと登録できない' do 
      @user.password_confirmation='a11111'
      @user.password='b11111'
      @user.valid? 
      expect(@user.errors.full_messages).to include( "パスワード（確認用）とパスワードの入力が一致しません")
    end 
  end
   context '本人情報確認' do
    it 'ユーザ本名は、名字が空だと登録できない' do
       @user.last_name=''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last nameを入力してください")
    end
    it 'ユーザ本名は、名前が空だと登録できない' do
       @user.first_name=''
       @user.valid?
       expect(@user.errors.full_messages).to include("First nameを入力してください")
     end
     it 'ユーザ本名(フリガナ)は、名字が空だと登録できない' do
      @user.last_name_kana=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanaを入力してください")
    end
    it 'ユーザ本名(フリガナ)は、名前が空だと登録できない' do
      @user.first_name_kana=''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanaを入力してください")
    end
    it 'ユーザ本名(フリガナ)は、名字が全角カタカナでないと登録できない' do 
      @user.last_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanaは不正な値です")
    end
    it 'ユーザ本名(フリガナ)は、名前が全角カタカナでないと登録できない' do 
      @user.first_name_kana='かな'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanaは不正な値です")
    end 
    it '生年月日が空だと登録できない' do
      @user.birth=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthを入力してください")
   end

     
   
   
   
  end

  end
end
