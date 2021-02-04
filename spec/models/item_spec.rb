require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '正常系[新規登録/商品出品]' do
    it '全ての項目が問題なく入力されていれば登録できる' do
      expect(@item).to be_valid
    end
  end

  describe '異常系[新規登録/ユーザー情報]' do
    it 'titleが空では登録できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Titleを入力してください')
    end
    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Descriptionを入力してください')
    end
    it 'category_idのidが１(--)では登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Categoryは「--」以外の値にしてください')
    end
    it 'item_state_idのidが１(--)では登録できない' do
      @item.item_state_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item stateは「--」以外の値にしてください')
    end
    it 'delivery_price_idのidが１(--)では登録できない' do
      @item.delivery_price_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery priceは「--」以外の値にしてください')
    end
    it 'prefecture_idのidが１(--)では登録できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefectureは「--」以外の値にしてください')
    end
    it 'delivery_day_idのidが１(--)では登録できない' do
      @item.delivery_day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery dayは「--」以外の値にしてください')
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Priceを入力してください')
    end
    it 'priceが300を超える数値では登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Priceは300以上の数値で入力してください')
    end
    it 'priceが999999を超える数値では登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Priceは999999以下の数値で入力してください')
    end
  end
end
