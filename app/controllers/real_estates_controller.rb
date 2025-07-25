class RealEstatesController < ApplicationController
  before_action :set_real_estate, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /real_estates
  def index
    @objects = @real_estates = RealEstate.all
  end

  # GET /real_estates/1
  def show
  end

  # GET /real_estates/new
  def new
    @object = @real_estate = RealEstate.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /real_estates/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /real_estates
  def create
    @object = @real_estate = RealEstate.new(real_estate_params)

    if @real_estate.save
      redirect_to @real_estate, notice: "Real estate was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /real_estates/1
  def update
    if @real_estate.update(real_estate_params)
      redirect_to @real_estate, notice: "Real estate was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /real_estates/1
  def destroy
    @real_estate.destroy!
    redirect_to real_estates_path, notice: "Real estate was successfully destroyed.", status: :see_other
  end

  def self.real_estate_params
    [
    :appreciation_rate, :kind_id,
    asset_attributes: [:assetable_type, :assetable_id, :name, :value, :notes, :location, :person_id, :id, :_destroy]
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real_estate
      @object = @real_estate = RealEstate.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def real_estate_params
      params.expect! real_estate: self.class.real_estate_params
    end
end
