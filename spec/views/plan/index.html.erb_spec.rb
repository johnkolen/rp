require 'rails_helper'

RSpec.describe "plan/index.html.erb", type: :view do
  it "renders" do
    render
    expect(rendered).to match(/Your Retirement Plan/)
  end
end
