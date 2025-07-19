class ApplicationController < ActionController::Base
  include ObjectView::ControllerBase
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if current_user.user?
      plan_path
    else
      root_path
    end
  end
end
