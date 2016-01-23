class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :creator_id
      t.references :user, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
