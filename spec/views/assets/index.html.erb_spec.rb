require 'rails_helper'

RSpec.describe "assets/index", type: :view do
  viewsSetup objects: [
               :create_asset_sample,
               :create_asset_sample
             ],
             user: :admin_user

  views_index
end
