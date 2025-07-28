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

  def self.get_delegate_attributes(mthd = nil)
    src = controller_name.singularize.classify.constantize
    mthd ||= "#{controller_name.singularize}able_types"
    { mthd.sub("_types", "_attributes").to_sym =>
     src.send(mthd).inject([]) do |rv, t|
       rv.union("#{t.pluralize}Controller".constantize.base_params)
     end
    }
  end
end
