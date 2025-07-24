class SavingsAccountsController < ApplicationController
  before_action :set_savings_account, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /savings_accounts
  def index
    @objects = @savings_accounts = SavingsAccount.all
  end

  # GET /savings_accounts/1
  def show
  end

  # GET /savings_accounts/new
  def new
    @object = @savings_account = SavingsAccount.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /savings_accounts/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /savings_accounts
  def create
    @object = @savings_account = SavingsAccount.new(savings_account_params)

    if @savings_account.save
      redirect_to @savings_account, notice: "Savings account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /savings_accounts/1
  def update
    if @savings_account.update(savings_account_params)
      redirect_to @savings_account, notice: "Savings account was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /savings_accounts/1
  def destroy
    @savings_account.destroy!
    redirect_to savings_accounts_path, notice: "Savings account was successfully destroyed.", status: :see_other
  end

  def self.savings_account_params
    [
    :interest_rate,
    asset_attributes: [:assetable_type, :assetable_id, :name, :value, :notes, :location, :person_id, :id, :_destroy]
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_savings_account
      @object = @savings_account = SavingsAccount.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def savings_account_params
      params.expect! savings_account: self.class.savings_account_params
    end
end
