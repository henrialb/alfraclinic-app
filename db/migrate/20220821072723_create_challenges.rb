class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.integer :result_unit
      t.string :category, array: true
      t.boolean :archived, default: false, index: true
      t.boolean :order_results_desc, default: true

      t.timestamps
    end
  end
end
