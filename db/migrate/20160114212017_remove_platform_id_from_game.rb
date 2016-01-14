class RemovePlatformIdFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :platform_id, :integer
  end
end
