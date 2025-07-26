require 'rails_helper'

RSpec.describe "/expenses", type: :request do
  requestsSetup object: :create_expense_sample,
                objects: [:create_expense_sample,
                          :create_expense_sample],
                user: :person_user,
                user_path: :switch_user_path

  # This should return the minimal set of attributes required to create a valid
  # Expense. As you add validations to Expense, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    #skip("Add one or more hashes of attributes valid for your model")
    [
      build(:expense_sample).to_params
      # build(:expense_sample, :with_trait).to_params
    ]
  }

  let(:invalid_attributes) {
    # skip("Add one or more hashes of attributes invalid for your model")
    build(:expense_sample).
      to_params expenseable_attributes: {increase_rate: -1}
  }

  let(:new_attributes) {
    #skip("Add one or more hash of attributes valid for your model")
    build(:expense_sample).to_params.slice(*%i[ expenseable_attributes ])
  }

  requests_get_index
  requests_get_show
  requests_get_new
  requests_get_edit
  requests_post_create
  requests_patch_update
  requests_delete_destroy

end
