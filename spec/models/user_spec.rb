require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '内容に問題がない場合' do
      it '必要情報が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameにスペースがあると登録できない' do
        @user.name = '山田 太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end

      it 'nameが半角だと登録できない' do
        @user.name = 'yamadatarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end

      it 'nameが全角半角混合だと登録できない' do
        @user.name = '山田tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '同じemail登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに「@」がない場合登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordがアルファベットのみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全角の場合は登録できない' do
        @user.password = '１２３ＡＢＣ'
        @user.password_confirmation = '１２３ＡＢＣ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password is invalid')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = '456def'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'numberが空では登録できない' do
        @user.number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Number can't be blank")
      end

      it 'numberが全角では登録できない' do
        @user.number = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include("Number is not a number")
      end

      it 'numberが英字では登録できない' do
        @user.number = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Number is not a number")
      end

      it 'numberが5桁以下では登録できない' do
        @user.number = 12345
        @user.valid?
        expect(@user.errors.full_messages).to include("Number is too short (minimum is 6 characters)")
      end

      it 'division_idが空では登録できない' do
        @user.division_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Division can't be blank")
      end

      it 'division_idが[1]では登録できない' do
        @user.division_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Division must be other than 1")
      end

      it 'office_idが空では登録できない' do
        @user.office_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Office can't be blank")
      end

      it 'division_idが[1]では登録できない' do
        @user.office_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Office must be other than 1")
      end





    end

  end

end

#bundle exec rspec spec/models/user_spec.rb