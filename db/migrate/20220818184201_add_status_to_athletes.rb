class AddStatusToAthletes < ActiveRecord::Migration[7.0]
  def change
    add_column :athletes, :archived, :boolean, default: false, index: true
  end
end
