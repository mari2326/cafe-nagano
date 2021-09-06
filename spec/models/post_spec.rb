require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
    end

    describe '新規投稿' do
      context '新規投稿できるとき' do
        it '全てが存在すれば投稿できる' do
          expect(@post).to be_valid
        end
      end

      context '新規投稿できないとき' do
        it 'nameが空では投稿できない' do
          @post.name = ''
          @post.valid?
          expect(@post.errors.full_messages).to include("Name can't be blank")
        end
        it 'textが空では投稿できない' do
          @post.text = ''
          @post.valid?
          expect(@post.errors.full_messages).to include("Text can't be blank")
        end
        it 'imageが空では投稿できない' do
          @post.image = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Image can't be blank")
        end
        it 'userが紐付いていないと出品できない' do
          @post.user = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("User must exist")
        end
      end
    end
  end
end
