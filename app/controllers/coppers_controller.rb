class CoppersController < ApplicationController
  before_action :set_copper, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /coppers
  def index
    @objects = @coppers = Copper.all
  end

  # GET /coppers/1
  def show
  end

  # GET /coppers/new
  def new
    @object = @copper = Copper.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /coppers/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /coppers
  def create
    @object = @copper = Copper.new(copper_params)

    if @copper.save
      redirect_to @copper, notice: "Copper was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coppers/1
  def update
    if @copper.update(copper_params)
      redirect_to @copper, notice: "Copper was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /coppers/1
  def destroy
    @copper.destroy!
    redirect_to coppers_path, notice: "Copper was successfully destroyed.", status: :see_other
  end

  # params
  def self.copper_params
    [
       *base_params,
       asset_attributes: [ AssetsController.base_params ]
    ]
   end
   def self.base_params
    [
    :weight_kg

    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_copper
      @object = @copper = Copper.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def copper_params
      params.expect! copper: self.class.copper_params
    end
end
