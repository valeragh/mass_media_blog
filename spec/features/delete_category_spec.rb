=begin
Пользователь перешел на страницу Категории и нажал кнопку "Удалить",
и удалил Категорию.
=end

require 'rails_helper'

feature 'delete category' do
  scenario 'confirm action' do
  	category = create(:category,
			  name: 'First category .',
			  description: 'Description category')
		visit("/categories/#{category.id}")
		click_on('deleteCategory')

		expect(page).to have_content('Successfully destroyed...')
    expect(page).to have_current_path(categories_path)
	end
end
