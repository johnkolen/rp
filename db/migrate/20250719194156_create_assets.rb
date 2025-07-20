class CreateAssets < ActiveRecord::Migration[8.0]
  def change
    create_table :assets do |t|
      t.string :assetable_type
      t.integer :assetable_id
      t.string :name
      t.decimal :value
      t.string :notes
      t.string :location

      t.timestamps
    end
  end
end
