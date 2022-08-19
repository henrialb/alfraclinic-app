class CreateAthletes < ActiveRecord::Migration[7.0]
  def change
    create_table :athletes do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :level, default: 0

      t.timestamps
    end
  end
end
