require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_form).to be_valid
    end

    it '建物名は空でも保存できること' do
      @order_form.building = ''
      expect(@order_form).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空では保存できないこと' do
      @order_form.postal_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンがないと保存できないこと' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Postal code is invalid')
    end

    it 'prefecture_idが1では保存できないこと' do
      @order_form.prefecture_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では保存できないこと' do
      @order_form.city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it 'addressesが空では保存できないこと' do
      @order_form.addresses = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Addresses can't be blank")
    end

    it 'phone_numberが空では保存できないこと' do
      @order_form.phone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberにハイフンがあると保存できないこと' do
      @order_form.phone_number = '090-1234-5678'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが9桁以下では保存できないこと' do
      @order_form.phone_number = '090123456'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが12桁以上では保存できないこと' do
      @order_form.phone_number = '090123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空では保存できないこと' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では保存できないこと' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では保存できないこと' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end
