class LiabilitiesController < ApplicationController
  before_action :set_liability, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /liabilities
  def index
    @objects = @liabilities = Liability.all
  end

  # GET /liabilities/1
  def show
  end

  # GET /liabilities/new
  def new
    @object = @liability = Liability.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /liabilities/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /liabilities
  def create
    @object = @liability = Liability.new(liability_params)

    if @liability.save
      redirect_to @liability, notice: "Liability was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /liabilities/1
  def update
    if @liability.update(liability_params)
      redirect_to @liability, notice: "Liability was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /liabilities/1
  def destroy
    @liability.destroy!
    redirect_to liabilities_path, notice: "Liability was successfully destroyed.", status: :see_other
  end

  def self.liability_params
    [
    :liabilityable_type, :liabilityable_id, :name, :value, :notes, :location, :person_id,
    
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liability
      @object = @liability = Liability.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def liability_params
      params.expect! liability: self.class.liability_params
    end
end
