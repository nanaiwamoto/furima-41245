require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    # userを先に作成
    @user = FactoryBot.create(:user)
    # 作成したuserをitemに関連付けて作成
    @item = FactoryBot.create(:item, user: @user)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe 'バリデーション' do
    context '正常系' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '異常系' do
      it 'postal_codeが空では保存できないこと' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal codeを入力してください')
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal codeは不正な値です')
      end

      it 'shopping_region_idが1では保存できないこと' do
        @order_form.shopping_region_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Shopping regionは1以外の値にしてください')
      end

      it 'cityが空では保存できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Cityを入力してください')
      end

      it 'street_addressが空では保存できないこと' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Street addressを入力してください')
      end

      it 'telが空では保存できないこと' do
        @order_form.tel = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telを入力してください')
      end

      it 'telが10桁未満では保存できないこと' do
        @order_form.tel = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telは不正な値です')
      end

      it 'telが11桁を超過すると保存できないこと' do
        @order_form.tel = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telは不正な値です')
      end

      it 'telに半角数字以外が含まれている場合は保存できないこと' do
        @order_form.tel = '123-456-789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telは不正な値です')
      end

      it 'tokenが空では保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tokenを入力してください')
      end

      it 'user_idが空では保存できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Userを入力してください')
      end

      it 'item_idが空では保存できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Itemを入力してください')
      end
    end
  end
end
