require 'rails_helper'
describe User do
  describe '#create' do
    it "1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "2. nicknameが空では登録できないこと" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "3. emailが空では登録できないこと" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "4. passwordが空では登録できないこと" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

  it "5. passwordが存在してもpassword_confirmationが空では登録できないこと" do
    user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it "6. 重複したemailが存在する場合登録できないこと" do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("has already been taken")
  end

  it "7. passwordが6文字以上であれば登録できること" do
    user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "123456", password_confirmation: "123456")
    user.valid?
    expect(user).to be_valid
  end

  it "8. passwordが5文字以下であれば登録できないこと" do
    user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "12345", password_confirmation: "12345")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end
  end
end