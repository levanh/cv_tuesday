class AddIdealWeightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ideal_weight, :float
  end
end
