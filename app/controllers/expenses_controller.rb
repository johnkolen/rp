class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /expenses
  def index
    @objects = @expenses = Expense.all
  end

  # GET /expenses/1
  def show
  end

  # GET /expenses/new
  def new
    @object = @expense = Expense.new
    @object.person = current_user.person
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /expenses/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /expenses
  def create
    @object = @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to @expense, notice: "Expense was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1
  def update
    if @expense.update(expense_params)
      redirect_to @expense, notice: "Expense was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy!
    redirect_to expenses_path, notice: "Expense was successfully destroyed.", status: :see_other
  end

  def self.base_params
    [
      :expenseable_type,
      :expenseable_id,
      :name,
      :amount,
      :notes,
      :location,
      :person_id,
    ]
  end

  def self.expense_params
    [
      *base_params,
      **get_delegate_attributes
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @object = @expense = Expense.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.expect! expense: self.class.expense_params
    end
end
