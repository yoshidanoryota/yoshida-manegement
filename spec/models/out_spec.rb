require 'rails_helper'

RSpec.describe Out, type: :model do
  describe '退勤登録' do
    before do
      @out = FactoryBot.build(:out)
    end
    context '内容に問題がない場合' do
      it '必要情報が全て存在すれば登録できる' do
        expect(@out).to be_valid
      end

      it 'extraが[0]でも登録できる' do
        @out.extra_id = 0
        @out.valid?
        expect(@out).to be_valid
      end

    end

    context '内容に問題がある場合' do
      it 'out_dayが空では登録できない' do
        @out.out_day = ''
        @out.valid?
        expect(@out.errors.full_messages).to include("Out day can't be blank")
      end

      it 'off_idが[1]では登録できない' do
        @out.off_id = 1
        @out.valid?
        expect(@out.errors.full_messages).to include("Off must be other than 1")
      end

      it 'extra_idが空では登録できない' do
        @out.extra_id = ''
        @out.valid?
        expect(@out.errors.full_messages).to include("Extra can't be blank")
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
        @out.user = nil
        @out.valid?
        expect(@out.errors.full_messages).to include('User must exist')
      end



    





    end

  end
end

#bundle exec rspec spec/models/out_spec.rb