require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do

  context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")    
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")    
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")    
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")    
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")    
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")    
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")    
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")    
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")    
    end
    it "birth_dateが空だと登録できない" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")    
    end
    it "first_nameが半角だと登録できない" do
      @user.first_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end
    it "first_name_kanaが半角だと登録できない" do
      @user.first_name_kana = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end
    it "last_nameが半角だと登録できない" do
      @user.last_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end
    it "last_name_kanaが半角だと登録できない" do
      @user.last_name_kana = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end
    it "emailに@がないと登録できない" do
      @user.email = "abcgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  end

  context '新規登録がうまくいくとき' do
    it "emailに@があれば登録できる" do
      @user.email = "a@gmail.com"
      expect(@user).to be_valid   
    end
    it "passwordとpassword_confirmationが一致すれば登録できる" do
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end
    it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      @user.first_name = "漢字ひらカタ"
      expect(@user).to be_valid     
    end
    it "first_name_kanaが全角（カタカナ）であれば登録できる" do
      @user.first_name_kana = "カナ"
      expect(@user).to be_valid    
    end
    it "last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      @user.last_name = "漢字ひらカタ"
      expect(@user).to be_valid  
    end
    it "last_name_kanaが全角（カタカナ）であれば登録できる" do
      @user.last_name_kana = "カナ"
      expect(@user).to be_valid  
    end
  end
  
end
end