require 'rails_helper'

RSpec.describe "/people", type: :request do
  requestsSetup object: :create_social_security,
                objects: [:create_social_security_sample,
                          :create_social_security_sample],
                user: :person_user, user_path: :switch_user_path

  # This should return the minimal set of attributes required to create a valid
  # SocialSecurity. As you add validations to SocialSecurity, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    # skip("Add one or more hashes of attributes valid for your model")
    [
      build(:social_security_sample).to_params
      # build(:social_security_sample, :with_trait).to_params
    ]
  }

  let(:invalid_attributes) {
    # skip("Add one or more hashes of attributes invalid for your model")
    build(:social_security_sample).to_params benefit_at_62: -1
  }
  let(:new_attributes) {
    # skip("Add one or more hash of attributes valid for your model")
    build(:social_security_sample).to_params.slice(*%i[benefit_at_62 benefit_at_67 benefit_at_70 retirement_date ])
  }

  requests_get_index
  requests_get_show
  requests_get_new
  requests_get_edit
  requests_post_create
  requests_patch_update
  requests_delete_destroy

end
