class AddSportyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sporty, :boolean
  end
end
