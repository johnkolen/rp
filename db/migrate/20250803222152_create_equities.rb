class CreateEquities < ActiveRecord::Migration[8.0]
  def change
    create_table :equities do |t|
      t.decimal :return_rate, default: 0.0
      t.integer :duration_id, default: 0
      t.decimal :beta, default: 1.0
      t.integer :account_type_id, default: 0

      t.timestamps
    end
  end
end
