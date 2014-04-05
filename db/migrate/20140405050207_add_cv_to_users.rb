class AddCvToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cv, :string
		change_column(:users, :sporty, :string, default: "yes")
  end
end
