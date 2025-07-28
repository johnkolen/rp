require 'rails_helper'

RSpec.describe "/fixed_rate_mortgages", type: :request do
  requestsSetup object: :create_fixed_rate_mortgage,
                objects: [ :create_fixed_rate_mortgage_sample,
                          :create_fixed_rate_mortgage_sample ],
                user: :person_user,
                user_path: :switch_user_path

  # This should return the minimal set of attributes required to create a valid
  # FixedRateMortgage. As you add validations to FixedRateMortgage, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    # skip("Add one or more hashes of attributes valid for your model")
    [
      build(:fixed_rate_mortgage_sample).to_params
      # build(:fixed_rate_mortgage_sample, :with_trait).to_params
    ]
  }

  let(:invalid_attributes) {
    # skip("Add one or more hashes of attributes invalid for your model")
    build(:fixed_rate_mortgage).to_params interest_rate: -1
  }
  let(:new_attributes) {
    # skip("Add one or more hash of attributes valid for your model")
    build(:fixed_rate_mortgage_sample).
      to_params.slice(*%i[interest_rate])
  }

  requests_get_index
  requests_get_show
  requests_get_new
  requests_get_edit
  requests_post_create
  requests_patch_update
  requests_delete_destroy
end
