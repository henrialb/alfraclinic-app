class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.integer :result_unit
      t.integer :category
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
