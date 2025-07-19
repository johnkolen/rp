class PlanController < ApplicationController
  before_action :ensure_person
  def index
  end

  def ensure_person
    unless current_user.person
      redirect_to new_person_path
    end
  end
end
