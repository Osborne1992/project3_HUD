class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.references :post, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
