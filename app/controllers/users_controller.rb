class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_klass

  # GET /users
  def index
    @objects = @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @object = @user = User.new
    @object.add_builds!  # Used by Object View for templates
  end

  # GET /users/1/edit
  def edit
    @object.add_builds!  # Used by Object View for templates
  end

  # POST /users
  def create
    @object = @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
    redirect_to users_path, notice: "User was successfully destroyed.", status: :see_other
  end

  def self.user_params
    [
    :email, :password, :password_confirmation

    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @object = @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect! user: self.class.user_params
    end
end
