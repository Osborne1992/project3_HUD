class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :game, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :body
      t.integer :rate_average
      t.integer :rate_story
      t.integer :rate_difficulty
      t.integer :rate_length
      t.integer :rate_mechanics
      t.integer :rate_audio
      t.integer :rate_performance
      t.integer :rate_art_style
      t.integer :rate_immersion

      t.timestamps null: false
    end
  end
end
