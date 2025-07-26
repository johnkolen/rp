require 'rails_helper'

RSpec.describe Property, type: :model do
  it { expect(create(:property)).to be_a Property }
  it { expect(create(:property_sample)).to be_a Property }
  it "person has many properties" do
    p = create(:property_sample)
    px = p.person
    expect(px).to be_a Person
    px.properties.each do |prop|
      expect(prop).to be_a Property
    end
  end
end
