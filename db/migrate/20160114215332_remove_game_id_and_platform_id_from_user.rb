class RemoveGameIdAndPlatformIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :game_id, :integer
    remove_column :users, :platform_id, :integer
  end
end
