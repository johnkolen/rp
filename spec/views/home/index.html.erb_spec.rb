require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it "renders" do
    render
    expect(rendered).to match(/Retirement Partner/)
  end
end
