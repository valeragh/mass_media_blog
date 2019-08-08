class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :category_posts do |t|
      t.string :name
      t.text :description
      t.string :file

      t.timestamps
    end
  end
end
