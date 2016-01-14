class AddGameAndPlatformToUser < ActiveRecord::Migration
  def change
    add_reference :users, :game, index: true, foreign_key: true
    add_reference :users, :platform, index: true, foreign_key: true
  end
end
