=begin
Пользователь перешел на сайт и нажал кнопку "Создать Категорию",
ввел данные для создания категории и нажал кнопку "Создать".
=end

require 'rails_helper'

feature 'craete category' do
  scenario 'valid data' do
		visit("/")
		click_on('newCategory')

		fill_in('category_name', with: 'First category .')
		fill_in('category_description', with: 'Description category')
		click_on('submitCategory')

		expect(page).to have_content('First category .')
		expect(page).to have_content('Description category')
    expect(page).to have_current_path(category_path(Category.last))
	end

	scenario 'invalid data' do
		visit("/")
		click_on('newCategory')

		fill_in('category_name', with: 'First')
		click_on('submitCategory')

		expect(page).to have_content('Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale')
		expect(page).to have_current_path(categories_path)
	end
end
