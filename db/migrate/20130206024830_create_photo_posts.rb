class CreatePhotoPosts < ActiveRecord::Migration
  def change
    create_table :photo_posts do |t|
      t.integer :post_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
