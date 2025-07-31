class CreateSocialSecurities < ActiveRecord::Migration[8.0]
  def change
    create_table :social_securities do |t|
      t.decimal :benefit_at_62
      t.decimal :benefit_at_67
      t.decimal :benefit_at_70
      t.date :retirement_date

      t.timestamps
    end
  end
end
