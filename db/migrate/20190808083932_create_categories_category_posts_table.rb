class CreateCategoriesCategoryPostsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_category_posts, id: false do |t|
    	t.belongs_to :category
      t.belongs_to :category_post
    end
  end
end
