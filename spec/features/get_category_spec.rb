=begin
Пользователь перешел на страницу категории
и прочитал информацию о категории и связанные с категорией посты
=end

require 'rails_helper'

feature 'category page' do
	scenario 'user to category page' do
		category = create(:category,
			  name: 'First category .',
			  description: 'Description category')
		category_post = create(:category_post,
			  name: 'First post .',
			  description: 'Description post',
			  category_ids: category.id)
		visit("/categories/#{category.id}")

		expect(page).to have_content("First category .")
		expect(page).to have_content("Description category")
		expect(page).to have_content("First post .")
	end

	scenario 'render raw description' do
		category = create(:category, description: "That <em>was</em> hard")
		visit("/categories/#{category.id}")

		expect(page).to have_css('em', text: 'was')
	end

end