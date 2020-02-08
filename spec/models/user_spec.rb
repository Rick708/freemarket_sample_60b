require 'rails_helper'
describe User do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("必須入力です")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("メアドを入力してください")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("パスワードは?")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("同じパスワードを入力してね")
    end

    # # 6. nicknameが7文字以上であれば登録できないこと
    # it "is invalid with a nickname that has more than 7 characters " do
    #   user = build(:user, nickname: "aaaaaaaa")
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    # end

    # # 7. nicknameが6文字以下では登録できること
    # it "is valid with a nickname that has less than 6 characters " do
    #   user = build(:user, nickname: "aaaaaa")
    #   expect(user).to be_valid
    # end

    # 8. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("このメルアドは使われています")
    end

    # 9. passwordが6文字以上であれば登録できること
    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    # 10. passwordが5文字以下であれば登録できないこと
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("6文字以上のパスワードにしましょう")
    end
  end
end