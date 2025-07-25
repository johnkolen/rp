class CreateFixedRateMortgages < ActiveRecord::Migration[8.0]
  def change
    create_table :fixed_rate_mortgages do |t|
      t.decimal :pi_payment
      t.decimal :interest_rate
      t.references :property, null: false, foreign_key: true
      t.date :final_date

      t.timestamps
    end
  end
end
