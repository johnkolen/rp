class CheckingAccountsController < ApplicationController
  before_action :set_checking_account, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /checking_accounts
  def index
    @objects = @checking_accounts = CheckingAccount.all
  end

  # GET /checking_accounts/1
  def show
    # raise "#{@object.inspect}\n#{@object.asset.inspect}"
  end

  # GET /checking_accounts/new
  def new
    @object = @checking_account = CheckingAccount.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /checking_accounts/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /checking_accounts
  def create
    @object = @checking_account = CheckingAccount.new(checking_account_params)

    if @checking_account.save
      redirect_to @checking_account, notice: "Checking account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /checking_accounts/1
  def update
    if @checking_account.update(checking_account_params)
      redirect_to @checking_account, notice: "Checking account was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /checking_accounts/1
  def destroy
    @checking_account.destroy!
    redirect_to checking_accounts_path, notice: "Checking account was successfully destroyed.", status: :see_other
  end

  def self.base_params
    [
      :interest_rate
    ]
  end

  def self.checking_account_params
    [
      *base_params,
      asset_attributes: [ *AssetsController.base_params ]
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checking_account
      @object = @checking_account = CheckingAccount.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def checking_account_params
      params.expect! checking_account: self.class.checking_account_params
    end
end
