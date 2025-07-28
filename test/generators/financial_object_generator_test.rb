# test/lib/generators/my_engine/install_generator_test.rb
require "test_helper"
require "generators/financial_object/financial_object_generator"

class FinancialObjectGeneratorTest < Rails::Generators::TestCase
  tests FinancialObjectGenerator
  destination Rails.root.join("tmp/generators")

  setup :prepare_destination
  teardown :restore_destination

  test "generates copper asset" do
    run_generator %w[ copper asset weight_kg:decimal ]

    assert_migration "db/migrate/create_copper_table.rb"
  end
end
