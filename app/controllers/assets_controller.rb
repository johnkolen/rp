class AssetsController < ApplicationController
  before_action :set_asset, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /assets
  def index
    @objects = @assets = Asset.all
  end

  # GET /assets/1
  def show
  end

  # GET /assets/new
  def new
    @object = @asset = Asset.new
    @asset.person = current_user.person
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /assets/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /assets
  def create
    @object = @asset = Asset.new(asset_params)
    if @asset.save
      redirect_to @asset, notice: "Asset was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assets/1
  def update
    if @asset.update(asset_params)
      redirect_to @asset, notice: "Asset was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /assets/1
  def destroy
    @asset.destroy!
    redirect_to assets_path, notice: "Asset was successfully destroyed.", status: :see_other
  end

  def self.base_params
    [
      :assetable_type,
      :name,
      :value,
      :notes,
      :location,
      :person_id
    ]
  end

  def self.asset_params
    [
      *base_params,
      **get_delegate_attributes
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @object = @asset = Asset.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def asset_params
      params.expect! asset: self.class.asset_params
    end
end
