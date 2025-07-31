class SocialSecuritiesController < ApplicationController
  before_action :set_social_security, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /social_securities
  def index
    @objects = @social_securities = SocialSecurity.all
  end

  # GET /social_securities/1
  def show
  end

  # GET /social_securities/new
  def new
    @object = @social_security = SocialSecurity.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /social_securities/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /social_securities
  def create
    @object = @social_security = SocialSecurity.new(social_security_params)

    if @social_security.save
      redirect_to @social_security, notice: "Social security was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /social_securities/1
  def update
    if @social_security.update(social_security_params)
      redirect_to @social_security, notice: "Social security was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /social_securities/1
  def destroy
    @social_security.destroy!
    redirect_to social_securities_path, notice: "Social security was successfully destroyed.", status: :see_other
  end

  # params
  def self.social_security_params
    [
       *base_params,
       income_attributes: [IncomesController.base_params]
    ]
   end
   def self.base_params

    [
    :benefit_at_62, :benefit_at_67, :benefit_at_70, :retirement_date,
    
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_security
      @object = @social_security = SocialSecurity.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def social_security_params
      params.expect! social_security: self.class.social_security_params
    end
end
