require 'rails_helper'

RSpec.describe "assets/edit", type: :view do
  viewsSetup object: :create_asset_sample,
            user: :person_user

  views_edit

  it "displays asset" do
    a = Asset.new
    assign(:object, a)
    assign(:asset, a)
    render
    # puts rendered
  end
end
