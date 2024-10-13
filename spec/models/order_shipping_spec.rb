require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it '建物は空でも保存できること' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeは「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_shipping.postal_code = '1324566'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code はハイフンを含む半角数字で入力して下さい')
      end

      it '都道府県が必須であること' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @order_shipping.addresses = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号が必須であること' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order_shipping.phone_number = 123_456_789
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数字で入力して下さい')
      end

      it 'tokenが空では登録できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
