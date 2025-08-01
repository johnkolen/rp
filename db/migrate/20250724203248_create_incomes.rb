class CreateIncomes < ActiveRecord::Migration[8.0]
  def change
    create_table :incomes do |t|
      t.string :incomeable_type
      t.integer :incomeable_id
      t.string :name
      t.decimal :amount
      t.string :notes
      t.string :location
      t.date :start_date
      t.date :final_date, default: Date.new(2199, 12, 31)
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
