=begin
Пользователь перешел на страницу категории
и прочитал информацию о категории
=end

require 'rails_helper'

feature 'category page' do
	scenario 'user to category page' do
		category = create(:category,
			  name: 'First category .',
			  description: 'Description category')
		visit("/categories/#{category.id}")

		expect(page).to have_content("First category .")
		expect(page).to have_content("Description category")
	end

	scenario 'render raw description' do
		category = create(:category, description: "That <em>was</em> hard")
		visit("/categories/#{category.id}")

		expect(page).to have_css('em', text: 'was')
	end

end