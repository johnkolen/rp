require 'rails_helper'

RSpec.describe "social_securities/index", type: :view do
  viewsSetup objects: [
               :create_social_security_sample,
               :create_social_security_sample
             ],
             user: :admin_user

  views_index
end
