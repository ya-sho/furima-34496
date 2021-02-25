require 'rails_helper'
RSpec.describe Item, type: :model do
  before do 
    @item=FactoryBot.build(:item)
  end
  it '全て正常' do
    expect(@item).to be_valid
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

    it 'カテゴリーが1では登録できない' do 
      @item.category_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Categoryは1以外の値にしてください")
    end
    it '商品の状態が1では登録できない' do 
      @item.status_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Statusは1以外の値にしてください")
    end
    it '配送料の負担が1では登録できない' do 
      @item.cost_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Costは1以外の値にしてください")
    end
    it '配送元の地域が1では登録できない' do 
      @item.area_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Areaは1以外の値にしてください")
    end

    it '発送までの日数が空では登録できない' do 
      @item.days_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("Daysは数値で入力してください")
    end
    it '発送までの日数が1日では登録できない' do 
      @item.days_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Daysは1以外の値にしてください")
    end
    it '商品の値段が全角文字では登録できない' do 
      @item.price='あいう'
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
    end
    it '商品の値段が半角英数混合では登録できない' do 
      @item.price='abc123'
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
    end
    it '商品の値段が半角英語では登録できない' do 
      @item.price='abc'
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
    end
    it '商品の値段が299円以下では登録できない' do 
      @item.price=299
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceは300以上の値にしてください")
    end
    it '商品の値段が10,000,000円以上では登録できない' do 
      @item.price=10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceは10000000より小さい値にしてください")
    end
  end
end
