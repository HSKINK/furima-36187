require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeが半角のハイフンを含んでないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'postal_codeが全角を含むと保存できないこと' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipalityがだと保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'telephone_numberが空だと保存できないこと' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone number can't be blank", 'Telephone number is invalid.'
      end
      it 'telepohne_numberが全角数値だと保存できないこと' do
        @order_address.telephone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone number is invalid.'
      end
      it 'telepohne_numberにハイフンが存在すると保存できないこと' do
        @order_address.telephone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone number is invalid.'
      end
      it 'telepohne_numberが9桁以下だと保存できないこと' do
        @order_address.telephone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone number is invalid.'
      end
      it 'telepohne_numberが12桁以上だと保存できないこと' do
        @order_address.telephone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone number is invalid.'
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが紐付いていないと保存できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenがないと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
