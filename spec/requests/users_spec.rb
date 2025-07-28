require 'rails_helper'

RSpec.describe "/people", type: :request do
  requestsSetup object: :create_user,
                objects: [ :create_user_sample,
                          :create_user_sample ],
                user: :admin_user

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    # skip("Add one or more hashes of attributes valid for your model")
    [
      build(:user_sample).to_params.slice(:email).
        merge(password: 'password',
              password_confirmation: 'password')
    ]
  }

  let(:invalid_attributes) {
    # skip("Add one or more hashes of attributes invalid for your model")
    build(:user_sample).to_params(email: "invalid")  # bad param
    # build(:user_sample).to_params(password: "password",
    #                               password_confirmation: "notpassword")
  }

  let(:new_attributes) {
    # skip("Add one or more hash of attributes valid for your model")
    build(:user_sample).to_params.slice(*%i[email])
  }

  requests_get_index
  requests_get_show
  requests_get_new
  requests_get_edit
  requests_post_create
  requests_patch_update
  requests_delete_destroy
end
