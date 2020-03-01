require 'rails_helper'
describe Item do
  describe '#create' do
    # nameが空では登録できないこと
    it "is invalid without a name" do
      # user = build(:user)
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is valid with a name that has less than 6 characters" do
      # user = build(:user)
      image = build(:image)
      item = build(:item, name: "aaaaaa")
      expect(item).to be_valid
    end

    # it "is invalid without a content" do
    #   item = build(:item, content: "aaa")
    #   expect(item).to be_valid
    # end
  end
end