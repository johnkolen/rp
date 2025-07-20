class CreateSavingsAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :savings_accounts do |t|
      t.decimal :interest_rate

      t.timestamps
    end
  end
end
