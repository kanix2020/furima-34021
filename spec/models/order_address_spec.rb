require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '正常系[購入]' do
    it '全ての項目が問題なく入力されていれば登録できる' do
      expect(@order_address).to be_valid
    end
  end

  describe '異常系[購入]' do
    it 'postcodeが空では登録できない' do
      @order_address.postcode = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postcodeを入力してください')
    end
    it 'prefecture_idのidが１(--)では登録できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefectureは「--」以外の値にしてください')
    end
    it 'cityが空では登録できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Cityを入力してください')
    end
    it 'blockが空では登録できない' do
      @order_address.block = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Blockを入力してください')
    end
    it 'phone_numberが空では登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone numberを入力してください')
    end
    it 'postcodeはハイフンがなければ登録できない' do
      @order_address.postcode = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postcodeの保存にはハイフンが必要です。')
    end
    it 'postcodeは3文字目と4文字目の間にハイフンがなければ登録できない' do
      @order_address.postcode = '11-11111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postcodeの保存にはハイフンが必要です。')
    end
    it 'postcodeは全角で登録できない' do
      @order_address.postcode = 'あああ-ああああ'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postcodeの保存にはハイフンが必要です。')
    end
    it 'postcodeは半角英字で登録できない' do
      @order_address.postcode = 'aaa-aaaa'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postcodeの保存にはハイフンが必要です。')
    end
    it 'phone_numberは11桁以内でなければ登録できない' do
      @order_address.phone_number = '11223344556677'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number電話番号は11桁以内で入力してさい。')
    end
    it 'phone_numberは全角で登録できない' do
      @order_address.phone_number = 'ああああああ'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone numberは半角数字で入力してください')
    end
    it 'phone_numberは半角英字で登録できない' do
      @order_address.phone_number = 'abcdefg'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone numberは半角数字で入力してください')
    end
    it 'tokenが空では登録できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Tokenを入力してください')
    end
  end
end
