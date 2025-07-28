class IncomesController < ApplicationController
  before_action :set_income, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /incomes
  def index
    @objects = @incomes = Income.all
  end

  # GET /incomes/1
  def show
  end

  # GET /incomes/new
  def new
    @object = @income = Income.new
    @object.person = current_user.person
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /incomes/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /incomes
  def create
    @object = @income = Income.new(income_params)

    if @income.save
      redirect_to @income, notice: "Income was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /incomes/1
  def update
    if @income.update(income_params)
      redirect_to @income, notice: "Income was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /incomes/1
  def destroy
    @income.destroy!
    redirect_to incomes_path, notice: "Income was successfully destroyed.", status: :see_other
  end

  def self.base_params
    [
      :incomeable_type,
      :incomeable_id,
      :name,
      :value,
      :notes,
      :location,
      :person_id
    ]
  end

  def self.income_params
    [
      *base_params,
      **get_delegate_attributes
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @object = @income = Income.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def income_params
      params.expect! income: self.class.income_params
    end
end
