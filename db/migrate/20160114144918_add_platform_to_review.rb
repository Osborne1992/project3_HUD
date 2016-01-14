class AddPlatformToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :platform, index: true, foreign_key: true
  end
end
