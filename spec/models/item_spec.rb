require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品出品機能' do

  context '出品がうまくいかないとき' do
    it "titleが空だと登録できない" do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")    
    end
    it "explanationが空だと登録できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")    
    end
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")    
    end
    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")    
    end
    it "category_idが選択されていないと登録できない" do
      @item.category_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")    
    end
    it "condition_idが選択されていないと登録できない" do
      @item.condition_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition Select")    
    end
    it "delivery_fee_idが選択されていないと登録できない" do
      @item.delivery_fee_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee Select")    
    end
    it "shipment_sourceが選択されていないと登録できない" do
      @item.shipment_source_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment source Select")    
    end
    it "shipment_dateが選択されていないと登録できない" do
      @item.shipment_date_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment date Select")    
    end
    it "priceが300より少ないと登録できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")    
    end
    it "priceが9999999より多いと登録できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")    
    end
  end
end
end
