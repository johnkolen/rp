require 'rails_helper'

RSpec.describe "equities/index", type: :view do
  viewsSetup objects: [
               :create_equity_sample,
               :create_equity_sample
             ],
             user: :admin_user

  views_index
end
