=begin
Пользователь перешел на страницу Категории и нажал кнопку "Редактировать",
ввел нужные данные и нажал кнопку "Сохранить".
=end

require 'rails_helper'

feature 'edit category' do
  scenario 'valid data' do
  	category = create(:category,
			  name: 'First category .',
			  description: 'Description category')
		visit("/categories/#{category.id}")
		click_on('editCategory')

		fill_in('category_name', with: 'Edit category .')
		fill_in('category_description', with: 'Edit description category')
		click_on('submitCategory')

		expect(page).to have_content('Edit category .')
		expect(page).to have_content('Edit description category')
		expect(page).to have_content('Successfully updated...')
    expect(page).to have_current_path(category_path(Category.last))
	end

	scenario 'invalid data' do
		category = create(:category,
			  name: 'First category .',
			  description: 'Description category')
		visit("/categories/#{category.id}")
		click_on('editCategory')

		fill_in('category_name', with: 'First')
		click_on('submitCategory')

		expect(page).to have_content('Your name must be at least 2 words and minimum is 2 characters with point and first letter id capitale')
		expect(page).to have_content('Error...')
		expect(page).to have_current_path(category_path(category))
	end
end
