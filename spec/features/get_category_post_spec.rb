=begin
Пользователь перешел на страницу поста
и прочитал информацию о посте
=end

require 'rails_helper'

feature 'category_post page' do
	scenario 'user to category_post page' do
		category_post = create(:category_post,
			  name: 'First post .',
			  description: 'Description category post')
		visit("/category_posts/#{category_post.id}")

		expect(page).to have_content("First post .")
		expect(page).to have_content("Description category post")
	end

	scenario 'render raw description' do
		category_post = create(:category_post, description: "That <em>was</em> hard")
		visit("/category_posts/#{category_post.id}")

		expect(page).to have_css('em', text: 'was')
	end

	scenario 'show category_post comment' do
		category_post = create(:category_post)
		comment = create(:comment,
			author: 'First Author .',
			content: 'First content',
		  commentable_type: "CategoryPost",
		  commentable_id: category_post.id)
		visit("/category_posts/#{category_post.id}")

		expect(page).to have_content("First Author .")
		expect(page).to have_content("First content")
	end

	scenario 'create category_post comment', :js => true do
		category_post = create(:category_post)
		visit("/category_posts/#{category_post.id}")

		fill_in('comment_author', with: 'First Author .')
		fill_in('comment_content', with: 'First content')
		click_on('submitCommit')

		expect(page).to have_content("First Author .")
		expect(page).to have_content("First content")
	end

end