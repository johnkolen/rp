class CreateEmployments < ActiveRecord::Migration[8.0]
  def change
    create_table :employments do |t|
      t.decimal :gross
      t.integer :taxable_status_id
      t.boolean :ssi
      t.decimal :raise_rate

      t.timestamps
    end
  end
end
