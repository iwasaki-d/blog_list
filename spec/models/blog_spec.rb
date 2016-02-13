require 'rails_helper'

describe Blog do

  context '登録' do

    before do
      @blog = Blog.new
    end

    it 'titleがあれば有効な状態であること' do

      @blog.title = 'test'

      expect(@blog.save).to be_truthy

    end

    it 'titleがあれば無効な状態であること' do

      @blog.title = ''

      expect(@blog.save).to be_falsey

    end

    it '同じタイトルは無効である事' do

      title = 'Blog!!'

      @blog.title = title
      @blog.save

      @sametitle_blog = Blog.new
      @sametitle_blog.title = title

      expect(@sametitle_blog.save).to be_falsey

    end

  end

end
