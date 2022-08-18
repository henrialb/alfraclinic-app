class AddArchivedToAthletes < ActiveRecord::Migration[7.0]
  def change
    add_column :athletes, :archived, :integer, default: 0
  end
end
