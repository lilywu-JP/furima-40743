require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it '必要な情報全部記載済みの場合投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '商品画像がない場合投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名未記載の場合投稿できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'カテゴリ未記載の場合投稿できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態未記載の場合投稿できない' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end

      it '配送料未記載の場合投稿できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it '発送元の地域未記載の場合投稿できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数未記載の場合投稿できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it '価格未記載の場合投稿できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it '価格が300以下の場合投稿できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end

      it '価格が9999999越えた未記載の場合投稿できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end

      it '価格半角文字のみの場合投稿できない' do
        @item.item_price = 'ashdj'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '価格が半角文字数字混在の場合投稿できない' do
        @item.item_price = 'adj123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '価格が全角数字の場合投稿できない' do
        @item.item_price = '１２３６４７'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '価格が全角文字の場合投稿できない' do
        @item.item_price = 'ａｓｋｓｊｄ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '価格が全角文字数時混在の場合投稿できない' do
        @item.item_price = 'ａｓｋｓｊｄ１２'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
    end
  end
end
