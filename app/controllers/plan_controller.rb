class PlanController < ApplicationController
  before_action :ensure_person
  def index
    @person = current_user.person
  end

  def ensure_person
    if current_user.nil?
      redirect_to root_path
      return
    end
    if current_user.person.nil?
      session[:register] = true
      redirect_to new_person_path
      nil
    end
  end
end
