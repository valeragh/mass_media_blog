=begin
Пользователь перешел на сайт и увидел список категорий
=end

require 'rails_helper'

feature 'root page' do
	scenario 'user to list categories' do
		categories = [
			create(:category,
			  name: 'First category .'),
			create(:category,
			  name: 'Second category .')]
		visit("/")

		expect(page).to have_content("First category .")
		expect(page).to have_content("Second category .")
	end

end