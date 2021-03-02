require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
  context '商品購入に成功した時' do
    it 'すべての情報があれば登録できる' do
      expect(@order_address).to be_valid
    end
    it '建物が空でも登録できる' do
      @order_address.building=' '
      expect(@order_address).to be_valid
    end
  end

  context '商品購入に失敗した時' do
    it 'user_idが空だと保存できない' do
      @order_address.user_id = ' '
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Userを入力してください")
    end
    it 'item_idが空だと保存できない' do
      @order_address.item_id = ' '
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Itemを入力してください")
    end
    it '郵便番号が空だと保存できない' do
      @order_address.postal_code = ' '
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal codeを入力してください')
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal codeis invalid. Include hyphen(-)')
    end
    it '都道府県が空では登録できない' do
      @order_address.area_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Areaは数値で入力してください')
    end
    it '都道府県が1では登録できない' do
      @order_address.area_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Areaは1以外の値にしてください')
    end
    it '市区町村は空では登録できない' do
      @order_address.municipality = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Municipalityを入力してください')
    end
    it '市区町村は数字では登録できない' do
      @order_address.municipality = 123
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Municipalityは不正な値です')
    end
    it '番地が空では登録できない' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Addressを入力してください')
    end
    it '電話番号が空では登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone numberを入力してください')
    end
    it '電話番号が半角英語では登録できない' do
      @order_address.phone_number = 'aaaaaaaaaaa'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone numberは不正な値です')
    end
    it '電話番号が全角かなでは登録できない' do
      @order_address.phone_number = 'あああああああああああ'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone numberは不正な値です')
    end
    it '電話番号が11桁以内でないと登録できない' do
      @order_address.phone_number = '123456789876'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone numberは不正な値です')
    end
    it 'トークンが空では登録できない' do
      @order_address.token = ' '
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Tokenを入力してください')
    end
  end
  end
end
