class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.decimal :appreciation_rate
      t.integer :kind_id, default: 0

      t.timestamps
    end
  end
end
