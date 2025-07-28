class CreateCoppers < ActiveRecord::Migration[8.0]
  def change
    create_table :coppers do |t|
      t.decimal :weight_kg

      t.timestamps
    end
  end
end
