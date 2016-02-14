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

  describe 'POST #update' do

    before do
      post :create, blog: { title: 'catblog' }
    end

    it "変更後に@blogのshowに遷移すること" do
      put :update, id: assigns(:blog).id, blog: { title: 'macblog!!' }
      expect(response).to redirect_to(blog_path(assigns(:blog).id))
    end

    it "変更に失敗した場合は@blogのnewを再描画する事" do
      put :update, id: assigns(:blog).id, blog: { title: '' }
      expect(response).to render_template("edit")
    end

    it "不正なIDが渡された場合は改竄エラーとすること" do
      put :update, id: -1, blog: { title: '' }
      expect(response).to have_http_status(BlogList::Application.config.http_status_alter_parameter)
    end

  end

  describe 'POST #delete' do

    before do
      post :create, blog: { title: 'catblog' }
    end

    it "削除後に@blogのshowに遷移すること" do
      delete :destroy, id: assigns(:blog).id
      expect(response).to redirect_to(blogs_path())
    end

    it "不正なIDが渡された場合は改竄エラーとすること" do
      delete :destroy, id: -1
      expect(response).to have_http_status(BlogList::Application.config.http_status_alter_parameter)
    end

  end

end
