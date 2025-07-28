require 'rails_helper'

RSpec.describe "coppers/index", type: :view do
  viewsSetup objects: [
               :create_copper_sample,
               :create_copper_sample
             ],
             user: :admin_user

  views_index
end
