class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /properties
  def index
    @objects = @properties = Property.all
  end

  # GET /properties/1
  def show
  end

  # GET /properties/new
  def new
    @object = @property = Property.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /properties/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /properties
  def create
    @object = @property = Property.new(property_params)

    if @property.save
      redirect_to @property, notice: "Property was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      redirect_to @property, notice: "Property was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy!
    redirect_to properties_path, notice: "Property was successfully destroyed.", status: :see_other
  end

  def self.property_params
    [
    :appreciation_rate, :kind_id,
    asset_attributes: [:assetable_type, :name, :value, :notes, :location, :person_id, :id, :_destroy]
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @object = @property = Property.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.expect! property: self.class.property_params
    end
end
