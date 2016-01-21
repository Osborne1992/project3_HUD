class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :event, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      t.references :review, index: true, foreign_key: true
      t.references :tournament, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :body
      t.integer :plus_one
      t.integer :minus_one

      t.timestamps null: false
    end
  end
end
