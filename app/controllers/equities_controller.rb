class EquitiesController < ApplicationController
  before_action :set_equity, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /equities
  def index
    @objects = @equities = Equity.all
  end

  # GET /equities/1
  def show
  end

  # GET /equities/new
  def new
    @object = @equity = Equity.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /equities/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /equities
  def create
    @object = @equity = Equity.new(equity_params)

    if @equity.save
      redirect_to @equity, notice: "Equity was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equities/1
  def update
    if @equity.update(equity_params)
      redirect_to @equity, notice: "Equity was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /equities/1
  def destroy
    @equity.destroy!
    redirect_to equities_path, notice: "Equity was successfully destroyed.", status: :see_other
  end

  # params
  def self.equity_params
    [
       *base_params,
       asset_attributes: [AssetsController.base_params]
    ]
   end
   def self.base_params

    [
    :return_rate, :duration_id, :beta, :account_type_id,
    
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equity
      @object = @equity = Equity.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def equity_params
      params.expect! equity: self.class.equity_params
    end
end
