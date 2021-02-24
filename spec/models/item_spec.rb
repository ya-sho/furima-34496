require 'rails_helper'
RSpec.describe Item, type: :model do
  before do 
    @item=FactoryBot.build(:item)
  end
  describe '商品出品機能' do  
     it '写真が空では登録できない' do 
       @item.image= nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Imageを入力してください")
     end
    it '商品名が空では登録できない' do 
       @item.name=''
       @item.valid?
       expect(@item.errors.full_messages).to include("Nameを入力してください")
    end
    it '商品説明が空では登録できない' do 
      @item.explanation=''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanationを入力してください")
    end
    it 'カテゴリーが空では登録できない' do 
      @item.category_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("Categoryは数値で入力してください")
    end
    it '商品の状態が空では登録できない' do 
      @item.status_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("Statusは数値で入力してください")
    end
    it '配送料の負担が空では登録できない' do 
      @item.cost_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("Costは数値で入力してください")
    end
    it '配送元の地域が空では登録できない' do 
      @item.area_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("Areaは数値で入力してください")
    end
    it '発送までの日数が空では登録できない' do 
      @item.days_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("Daysは数値で入力してください")
    end

  end
end
