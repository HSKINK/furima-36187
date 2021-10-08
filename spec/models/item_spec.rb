require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品できるとき' do
      it '各項目に正しく入力がなされているなら登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product can't be blank"
      end
      it '商品の説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリーが---では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が---では登録できない' do
        @item.content_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end
      it '配送料の負担が---では登録できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end
      it '発送元の地域が---では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it '発送までの日数が---では登録できない' do
        @item.ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship can't be blank"
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list', 'Price is invalid'
      end
      it '価格が半角数字では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '価格が300未満では登録できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '価格が10,000,000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
    end
  end
end
