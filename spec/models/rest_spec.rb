require 'rails_helper'

RSpec.describe Rest, type: :model do
  describe '休暇登録' do
    before do
      @rest = FactoryBot.build(:rest)
    end
    context '内容に問題がない場合' do
      it '必要情報が全て存在すれば登録できる' do
        expect(@rest).to be_valid
      end

    end

    context '内容に問題がある場合' do
      it 'rest_dayが空では登録できない' do
        @rest.rest_day = ''
        @rest.valid?
        expect(@rest.errors.full_messages).to include("Rest day can't be blank")
      end

      it 'holiday_idが[1]では登録できない' do
        @rest.holiday_id = 1
        @rest.valid?
        expect(@rest.errors.full_messages).to include("Holiday must be other than 1")
      end

      #it 'flying_idが全角では登録できない' do
        #@attendance.flying_id = '１'
        #@attendance.valid?
        #expect(@attendance.errors.full_messages).to include("Flying can't be blank")
      #end

      #it 'flying_idが英字では登録できない' do
        #@attendance.flying_id = 'aaa'
        #@attendance.valid?
        #expect(@attendance.errors.full_messages).to include("Flying can't be blank")
      #end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @rest.user = nil
        @rest.valid?
        expect(@rest.errors.full_messages).to include('User must exist')
      end



    





    end

  end
end

#bundle exec rspec spec/models/rest_spec.rb
