require 'rails_helper'
require 'rails/generators'
require 'generators/financial_object/financial_object_generator'

RSpec.describe FinancialObjectGenerator, type: :generator do
  # destination Rails.root.join("tmp/generators")

  # include FileUtils::Tmpdir
  # include GeneratorSpec::TestCase

  #  Temporary directory for generated files
  # destination File.expand_path("../tmp", __FILE__)
  # tests YourGeneratorNameGenerator # The generator class to test

  before(:each) do
    # prepare_destination # Cleans up the temporary directory before each test
  end

  it "generates copper asset" do
    # remove_model 'copper'
    # self.methods.each do |m|
    #  puts m if /run/ =~ m.to_s
    # end
    # run_generator %w[ copper asset weight_kg:decimal ]
  end
end
