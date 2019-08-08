=begin
Пользователь перешел на страницу Постов и увидел список постов
=end

require 'rails_helper'

feature 'category_post page' do
	scenario 'user to list category_post' do
		category_posts = [
			create(:category_post,
			  name: 'First post .'),
			create(:category_post,
			  name: 'Second post .')]
		visit("/category_posts")

		expect(page).to have_content("First post .")
		expect(page).to have_content("Second post .")
	end

end