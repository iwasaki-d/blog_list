require 'rails_helper'

RSpec.feature "Blogs", type: :feature do

  scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do

    visit blogs_path
    click_link 'New blog'
    fill_in 'Title', with: ''
    click_button 'Save'

    expect(page).to have_content 'prohibited this rails_blog from being saved'
  end

  scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること' do

    visit blogs_path
    click_link 'New blog'
    fill_in 'Title', with: 'TitleTest'

    expect {
      click_button 'Save'
    }.to change(Blog, :count).by(1)

    expect(current_path).to eq blog_path(id: Blog.last)

    expect(page).to have_content 'Blog was successfully created.'

  end
end
