=begin
Пользователь перешел на страницу Поста и нажал кнопку "Редактировать",
ввел нужные данные и нажал кнопку "Сохранить".
=end

require 'rails_helper'

feature 'edit category_post' do
  scenario 'valid data' do
  	category_post = create(:category_post,
			  name: 'First post .',
			  description: 'Description category post')
		visit("/category_posts/#{category_post.id}")
		click_on('editCategoryPost')

		fill_in('category_post_name', with: 'Edit post .')
		fill_in('category_post_description', with: 'Edit description category post')
		click_on('submitCategoryPost')

		expect(page).to have_content('Edit post .')
		expect(page).to have_content('Edit description category post')
		expect(page).to have_content('Successfully updated...')
    expect(page).to have_current_path(category_post_path(CategoryPost.last))
	end

	scenario 'invalid data' do
		category_post = create(:category_post,
			  name: 'First post .',
			  description: 'Description category post')
		visit("/category_posts/#{category_post.id}")
		click_on('editCategoryPost')

		fill_in('category_post_name', with: 'First')
		click_on('submitCategoryPost')

		expect(page).to have_content('Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale')
		expect(page).to have_content('Error...')
		expect(page).to have_current_path(category_post_path(category_post))
	end
end
