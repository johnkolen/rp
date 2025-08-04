require 'rails_helper'

RSpec.describe "/people", type: :request do
  requestsSetup object: :create_equity,
                objects: [:create_equity_sample,
                          :create_equity_sample],
                user: :person_user, user_path: :switch_user_path

  # This should return the minimal set of attributes required to create a valid
  # Equity. As you add validations to Equity, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    # skip("Add one or more hashes of attributes valid for your model")
    [
      build(:equity_sample).to_params
      # build(:equity_sample, :with_trait).to_params
    ]
  }

  let(:invalid_attributes) {
    # skip("Add one or more hashes of attributes invalid for your model")
    build(:equity_sample).to_params return_rate: -1
  }
  let(:new_attributes) {
    # skip("Add one or more hash of attributes valid for your model")
    build(:equity_sample).to_params.slice(*%i[return_rate duration_id beta account_type_id ])
  }

  requests_get_index
  requests_get_show
  requests_get_new
  requests_get_edit
  requests_post_create
  requests_patch_update
  requests_delete_destroy

end
