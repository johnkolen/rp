class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.string :expenseable_type
      t.integer :expenseable_id
      t.string :name
      t.decimal :amount
      t.string :notes
      t.string :location
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
