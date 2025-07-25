class CreateLiabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :liabilities do |t|
      t.string :liabilityable_type
      t.integer :liabilityable_id
      t.string :name
      t.decimal :value
      t.string :notes
      t.string :location
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
