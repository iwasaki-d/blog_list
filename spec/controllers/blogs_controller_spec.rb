require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

  describe 'GET #index' do

    before do
      post :create, blog: { title: 'catblog' }
      post :create, blog: { title: 'dogblog' }
    end

    it "@blogsに全てのBlogが入っていること" do
      get :index
      expect(assigns(:blogs)).to eq(Blog.all)
    end
  end

  describe 'POST #create' do
    it "新規作成後に@blogのshowに遷移すること" do
      post :create, blog: { title: 'macblog' }
      expect(response).to redirect_to(blog_path(assigns(:blog)))
    end

    it "新規作成に失敗した場合は@blogのnewを再描画する事" do

      same_title = "macblog"
      post :create, blog: { title: same_title }
      post :create, blog: { title: same_title }
      expect(response).to render_template("new")
    end
  end

end
