class AddStatisticsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :total_duration, :integer, :default => 0
    add_column :users, :longest_duration, :integer, :default => 0
    add_column :users, :total_points, :integer, :default => 0
    add_column :users, :max_points, :integer, :default => 0
    add_column :users, :enemies_killed, :integer, :default => 0
    add_column :users, :projectiles_fired, :integer, :default => 0
    add_column :users, :accuracy, :integer, :default => 0
  end
end
