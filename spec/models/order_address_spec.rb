require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '注文情報の保存' do
    before do
      # binding.pry
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '保存ができる場合' do
      it 'token, postal_code, area_id, municipality, block, phone_numberがあれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '建物名がからの場合でも保存ができる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '保存ができない場合' do
      it 'user_idが紐ついていない場合保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐ついていない場合保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフンが含まれていない場合保存できないこと' do
        @order_address.postal_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'area_idが1では保存できないこと' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空白では保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'blockが空白では保存できないこと' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberは空白では保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは10文字以下では保存できないこと' do
        @order_address.phone_number = '08000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberは10文字以下では保存できないこと' do
        @order_address.phone_number = '080000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberは半角数値でなければ保存できないこと' do
        @order_address.phone_number = 'aaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
    end
  end
end
