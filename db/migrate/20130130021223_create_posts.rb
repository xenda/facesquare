class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :title
      t.string :kind
      t.datetime :published_at

      t.timestamps
    end
  end
end
