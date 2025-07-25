require 'rails_helper'

RSpec.describe "properties/index", type: :view do
  viewsSetup objects: [
               :create_property_sample,
               :create_property_sample
             ],
             user: :admin_user

  views_index
end
