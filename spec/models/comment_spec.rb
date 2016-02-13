require 'rails_helper'

RSpec.describe Comment, type: :model do

  context '登録' do

    before do
      @comment  = Comment.new
    end

    context 'Body' do

      before do
        @comment.entry_id = 100
      end

      it 'bodyがあれば有効な状態であること' do

        @comment.body = 'test'

        expect(@comment.save).to be_truthy

      end

      it 'bodyがあれば無効な状態であること' do

        @comment.body = ''

        expect(@comment.save).to be_falsey

      end

    end

    context 'entry_id' do

      before do
        @comment.body = 'test_body'
      end

      it 'entry_idが無効な状態である事' do

        @comment.entry_id = '0'

        expect(@comment.save).to be_falsey

      end

      it 'entry_idが有効な状態である事' do

        @comment.entry_id = 1

        expect(@comment.save).to be_truthy

      end


      it 'entry_idが文字列なら無効な状態である事' do

        @comment.entry_id = 'test'

        expect(@comment.save).to be_falsey

      end

    end

  end

end
