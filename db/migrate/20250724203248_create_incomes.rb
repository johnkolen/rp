class CreateIncomes < ActiveRecord::Migration[8.0]
  def change
    create_table :incomes do |t|
      t.string :incomeable_type
      t.integer :incomeable_id
      t.string :name
      t.decimal :value
      t.string :notes
      t.string :location
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
