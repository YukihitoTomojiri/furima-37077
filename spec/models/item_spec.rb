require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の投稿' do
    context "商品投稿ができる場合"do
      it "image, item, comment, category_id, postage_type_id, status_id, area_id, preparation_day_id, priceが存在すれば投稿できる" do
        expect(@item).to be_valid
      end
    end
    context "商品投稿ができない場合" do
      it "imageが空白の場合"do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank") 
      end
      it "itemが空白の場合" do
        @item.item = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it "commentが空白の場合" do
        @item.comment = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it "category_idが1の場合" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be Blank")
      end
      it "postage_type_idが1の場合" do
        @item.postage_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage type can't be Blank")
      end
      it "status_idが1の場合" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be Blank")
      end
      it "area_idが1の場合" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be Blank")
      end
      it "preparation_day_idが1の場合" do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be Blank")
      end
      it "priceが空白の場合" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300円以下の場合" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceが9999999円以上の場合" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceに半角数字以外が含まれている場合" do
        @item.price = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "userが紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
    
  end
end
