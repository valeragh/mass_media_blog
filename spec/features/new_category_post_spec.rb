=begin
Пользователь перешел на страницу Постов и нажал кнопку "Создать Пост",
ввел данные для создания Поста и нажал кнопку "Сохранить".
=end

require 'rails_helper'

feature 'craete category_post' do
  scenario 'valid data' do
		visit("/category_posts")
		click_on('newCategoryPost')

		fill_in('category_post_name', with: 'First post .')
		fill_in('category_post_description', with: 'Description category post')
		click_on('submitCategoryPost')

		expect(page).to have_content('First post .')
		expect(page).to have_content('Description category post')
		expect(page).to have_content('Successfully created...')
    expect(page).to have_current_path(category_post_path(CategoryPost.last))
	end

	scenario 'invalid data' do
		visit("/category_posts")
		click_on('newCategoryPost')

		fill_in('category_post_name', with: 'First')
		click_on('submitCategoryPost')

		expect(page).to have_content('Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale')
		expect(page).to have_content('Error...')
		expect(page).to have_current_path(category_posts_path)
	end
end
