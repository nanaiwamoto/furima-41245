require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'すべての値が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      # 商品画像のテスト
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      # 商品名のテスト
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      # 商品説明のテスト
      it '商品説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      # ActiveHash関連のテスト
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shopping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping cost can't be blank")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.shopping_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping region can't be blank")
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shopping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping day can't be blank")
      end

      # 価格のテスト
      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '300円'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      # 出品者情報のテスト
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
