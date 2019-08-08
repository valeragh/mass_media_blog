=begin
Пользователь перешел на страницу Поста и нажал кнопку "Удалить",
и удалил Категорию.
=end

require 'rails_helper'

feature 'delete category_post' do
  scenario 'confirm action' do
  	category_post = create(:category_post,
			  name: 'First post .',
			  description: 'Description category post')
		visit("/category_posts/#{category_post.id}")
		click_on('deleteCategoryPost')

		expect(page).to have_content('Successfully destroyed...')
    expect(page).to have_current_path(category_posts_path)
	end
end
