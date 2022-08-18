class AddStatusToAthletes < ActiveRecord::Migration[7.0]
  def change
    add_column :athletes, :status, :integer, default: 0
  end
end
