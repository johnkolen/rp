class FixedRateMortgagesController < ApplicationController
  before_action :set_fixed_rate_mortgage, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /fixed_rate_mortgages
  def index
    @objects = @fixed_rate_mortgages = FixedRateMortgage.all
  end

  # GET /fixed_rate_mortgages/1
  def show
  end

  # GET /fixed_rate_mortgages/new
  def new
    @object = @fixed_rate_mortgage = FixedRateMortgage.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /fixed_rate_mortgages/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /fixed_rate_mortgages
  def create
    @object = @fixed_rate_mortgage = FixedRateMortgage.new(fixed_rate_mortgage_params)

    if @fixed_rate_mortgage.save
      redirect_to @fixed_rate_mortgage, notice: "Fixed rate mortgage was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fixed_rate_mortgages/1
  def update
    if @fixed_rate_mortgage.update(fixed_rate_mortgage_params)
      redirect_to @fixed_rate_mortgage, notice: "Fixed rate mortgage was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /fixed_rate_mortgages/1
  def destroy
    @fixed_rate_mortgage.destroy!
    redirect_to fixed_rate_mortgages_path, notice: "Fixed rate mortgage was successfully destroyed.", status: :see_other
  end

  def self.base_params
    [
      :pi_payment,
      :interest_rate,
      :final_date,
      :property_id
      # property_attributes: [ PropertiesController.property_params ]
    ]
  end

  def self.fixed_rate_mortgage_params
    [ *base_params,
      liability_attributes: [ LiabilitiesController.base_params ]
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fixed_rate_mortgage
      @object = @fixed_rate_mortgage = FixedRateMortgage.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fixed_rate_mortgage_params
      params.expect! fixed_rate_mortgage: self.class.fixed_rate_mortgage_params
    end
end
