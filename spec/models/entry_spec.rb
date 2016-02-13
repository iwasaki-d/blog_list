require 'rails_helper'

RSpec.describe Entry, type: :model do

  context '登録' do

    before do
      @entry  = Entry.new
    end

    context 'Title' do

      before do
        @entry.body  = 'test_entry'
        @entry.blog_id = 100
      end

      it 'titleがあれば有効な状態であること' do

        @entry.title = 'test'

        expect(@entry.save).to be_truthy

      end

      it 'titleがあれば無効な状態であること' do

        @entry.title = ''

        expect(@entry.save).to be_falsey

      end

    end

    context 'Body' do

      before do
        @entry.title  = 'test_title'
        @entry.blog_id = 100
      end

      it 'bodyがあれば有効な状態であること' do

        @entry.body = 'test'

        expect(@entry.save).to be_truthy

      end

      it 'bodyがあれば無効な状態であること' do

        @entry.body = ''

        expect(@entry.save).to be_falsey

      end

    end

    context 'blog_id' do

      before do
        @entry.title  = 'test_title'
        @entry.body = 'test_body'
      end

      it 'blog_idが0なら無効な状態である事' do

        @entry.blog_id = '0'

        expect(@entry.save).to be_falsey

      end

      it 'blog_idが0以上なら有効な状態である事' do

        @entry.blog_id = 1

        expect(@entry.save).to be_truthy

      end


      it 'blog_idが文字列なら無効な状態である事' do

        @entry.blog_id = 'test'

        expect(@entry.save).to be_falsey

      end

    end

  end

end

