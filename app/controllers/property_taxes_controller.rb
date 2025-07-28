class PropertyTaxesController < ApplicationController
  before_action :set_property_tax, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /property_taxes
  def index
    @objects = @property_taxes = PropertyTax.all
  end

  # GET /property_taxes/1
  def show
  end

  # GET /property_taxes/new
  def new
    @object = @property_tax = PropertyTax.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /property_taxes/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /property_taxes
  def create
    @object = @property_tax = PropertyTax.new(property_tax_params)

    if @property_tax.save
      redirect_to @property_tax, notice: "Property tax was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /property_taxes/1
  def update
    if @property_tax.update(property_tax_params)
      redirect_to @property_tax, notice: "Property tax was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /property_taxes/1
  def destroy
    @property_tax.destroy!
    redirect_to property_taxes_path, notice: "Property tax was successfully destroyed.", status: :see_other
  end

  def self.base_params
    [
      :increase_rate,
      property_attributes: PropertiesController.base_params
    ]
  end

  def self.property_tax_params
    [
      *base_params,
      expense_attributes: [ *ExpensesController.base_params ]
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_tax
      @object = @property_tax = PropertyTax.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def property_tax_params
      params.expect! property_tax: self.class.property_tax_params
    end
end
