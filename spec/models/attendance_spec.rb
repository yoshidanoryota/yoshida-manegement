require 'rails_helper'

RSpec.describe Attendance, type: :model do
  describe '出勤登録' do
    before do
      @attendance = FactoryBot.build(:attendance)
    end
    context '内容に問題がない場合' do
      it '必要情報が全て存在すれば登録できる' do
        expect(@attendance).to be_valid
      end

      it 'flyingが[0]でも登録できる' do
        @attendance.flying_id = 0
        @attendance.valid?
        expect(@attendance).to be_valid
      end

    end

    context '内容に問題がある場合' do
      it 'attendance_dayが空では登録できない' do
        @attendance.attendance_day = ''
        @attendance.valid?
        expect(@attendance.errors.full_messages).to include("Attendance day can't be blank")
      end

      it 'arrive_idが[1]では登録できない' do
        @attendance.arrive_id = 1
        @attendance.valid?
        expect(@attendance.errors.full_messages).to include("Arrive must be other than 1")
      end

      it 'flying_idが空では登録できない' do
        @attendance.flying_id = ''
        @attendance.valid?
        expect(@attendance.errors.full_messages).to include("Flying can't be blank")
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
        @attendance.user = nil
        @attendance.valid?
        expect(@attendance.errors.full_messages).to include('User must exist')
      end



    





    end

  end
end

#bundle exec rspec spec/models/attendance_spec.rb