class CreatePropertyTaxes < ActiveRecord::Migration[8.0]
  def change
    create_table :property_taxes do |t|
      t.decimal :increase_rate
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
