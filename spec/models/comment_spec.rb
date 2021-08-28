require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント登録' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context '内容に問題がない場合' do
      it '必要情報が全て存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'textが空では登録できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end

    end  
  end

end



#bundle exec rspec spec/models/comment_spec.rb

