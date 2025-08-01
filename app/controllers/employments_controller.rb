class EmploymentsController < ApplicationController
  before_action :set_employment, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /employments
  def index
    @objects = @employments = Employment.all
  end

  # GET /employments/1
  def show
  end

  # GET /employments/new
  def new
    @object = @employment = Employment.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /employments/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /employments
  def create
    @object = @employment = Employment.new(employment_params)

    if @employment.save
      redirect_to @employment, notice: "Employment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employments/1
  def update
    if @employment.update(employment_params)
      redirect_to @employment, notice: "Employment was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /employments/1
  def destroy
    @employment.destroy!
    redirect_to employments_path, notice: "Employment was successfully destroyed.", status: :see_other
  end

  def self.base_params
    [
      :gross,
      :taxable_status_id,
      :ssi,
      :raise_rate,
    ]
  end

  def self.employment_params
    [
      *base_params,
      income_attributes: [ IncomesController.base_params ]
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment
      @object = @employment = Employment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def employment_params
      params.expect! employment: self.class.employment_params
    end
end
