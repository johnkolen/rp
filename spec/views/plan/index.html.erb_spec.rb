require 'rails_helper'

RSpec.describe "plan/index.html.erb", type: :view do
  it "renders empty" do
    p = create(:person_sample)
    assign(:person, p)
    render
    expect(rendered).to match(/Your Retirement Plan/)
    expect(rendered).to match(/Assets: 0/)
    expect(rendered).not_to match(/projection/)
  end
  it "renders one asset" do
    p = create(:person_sample)
    sa = create(:savings_account)
    sa.asset.person_id = p.id
    sa.save
    assign(:person, p)
    render
    expect(rendered).to match(/Assets: 1/)
    expect(rendered).to match(/projection/)
  end
end
