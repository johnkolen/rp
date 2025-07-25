require 'rails_helper'

RSpec.describe "/people", type: :request do
  requestsSetup object: :create_property_tax,
                objects: [:create_property_tax_sample,
                          :create_property_tax_sample],
                user: :admin_user

  # This should return the minimal set of attributes required to create a valid
  # PropertyTax. As you add validations to PropertyTax, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add one or more hashes of attributes valid for your model")
    [
      # build(:property_tax).to_params
      # build(:property_tax_sample, :with_trait).to_params
    ]
  }

  let(:invalid_attributes) {
    skip("Add one or more hashes of attributes invalid for your model")
    # build(:property_tax).to_params ssn: "9208211"  # bad param
  }
  let(:new_attributes) {
    skip("Add one or more hash of attributes valid for your model")
    # build(:property_tax_sample).to_params.slice(*%i[last_name first_name])
  }

  requests_get_index
  requests_get_show
  requests_get_new
  requests_get_edit
  requests_post_create
  requests_patch_update
  requests_delete_destroy

end
