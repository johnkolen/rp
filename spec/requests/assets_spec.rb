require 'rails_helper'

RSpec.describe "/people", type: :request do
  requestsSetup object: :create_asset,
                objects: [:create_asset_sample,
                          :create_asset_sample],
                user: :admin_user
  #before :all do
  #  @person = create(:person_sample, user: user)
  #end
  #after :all do
  #  @person.destroy
  #end

  # This should return the minimal set of attributes required to create a valid
  # Asset. As you add validations to Asset, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    #skip("Add one or more hashes of attributes valid for your model")
    [
      build(:asset_sample).to_params
      # build(:asset_sample, :with_trait).to_params
    ]
  }

  let(:invalid_attributes) {
    #skip("Add one or more hashes of attributes invalid for your model")
    build(:asset).to_params value: -1  # bad param
  }
  let(:new_attributes) {
    #skip("Add one or more hash of attributes valid for your model")
    build(:asset_sample).to_params.slice(*%i[name value location notes])
  }

  requests_get_index
  requests_get_show
  requests_get_new
  requests_get_edit
  requests_post_create
  requests_patch_update
  requests_delete_destroy

end
