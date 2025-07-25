require 'rails_helper'

RSpec.describe "liabilities/index", type: :view do
  viewsSetup objects: [
               :create_liability_sample,
               :create_liability_sample
             ],
             user: :admin_user

  views_index
end
