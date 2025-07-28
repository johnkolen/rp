require 'rails_helper'

RSpec.describe "/people", type: :request do
  requestsSetup object: :create_copper,
                objects: [ :create_copper_sample,
                          :create_copper_sample ],
                user: :person_user, user_path: :switch_user_path

  # This should return the minimal set of attributes required to create a valid
  # Copper. As you add validations to Copper, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    # skip("Add one or more hashes of attributes valid for your model")
    [
      build(:copper_sample).to_params
      # build(:copper_sample, :with_trait).to_params
    ]
  }

  let(:invalid_attributes) {
    # skip("Add one or more hashes of attributes invalid for your model")
    build(:copper_sample).to_params weight_kg: -1
  }
  let(:new_attributes) {
    # skip("Add one or more hash of attributes valid for your model")
    build(:copper_sample).to_params.slice(*%i[weight_kg ])
  }

  requests_get_index
  requests_get_show
  requests_get_new
  requests_get_edit
  requests_post_create
  requests_patch_update
  requests_delete_destroy
end
