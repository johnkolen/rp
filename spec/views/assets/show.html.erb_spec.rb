require 'rails_helper'

RSpec.describe "assets/show", type: :view do
  viewsSetup object: :create_asset,
             user: :admin_user

  views_show

  it "shows asset" do
    a = Asset.new
    #assign(:object, a)
    #assign(:asset, a)
    render
    puts rendered
  end
end
