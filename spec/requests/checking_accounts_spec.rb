require 'rails_helper'

RSpec.describe "/people", type: :request do
  requestsSetup object: :create_checking_account,
                objects: [:create_checking_account_sample,
                          :create_checking_account_sample],
                user: :admin_user

  # This should return the minimal set of attributes required to create a valid
  # CheckingAccount. As you add validations to CheckingAccount, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    #skip("Add one or more hashes of attributes valid for your model")
    [
      build(:checking_account).to_params
      # build(:checking_account_sample, :with_trait).to_params
    ]
  }

  let(:invalid_attributes) {
    #skip("Add one or more hashes of attributes invalid for your model")
    build(:checking_account).to_params interest_rate: "-1"  # bad param
  }
  let(:new_attributes) {
    #skip("Add one or more hash of attributes valid for your model")
    build(:checking_account_sample).to_params.slice(*%i[interest_rate])
  }

  requests_get_index
  requests_get_show
  requests_get_new
  requests_get_edit
  requests_post_create
  requests_patch_update
  requests_delete_destroy

end
