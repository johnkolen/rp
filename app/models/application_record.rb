class ApplicationRecord < ActiveRecord::Base
  include ObjectView::Record

  primary_abstract_class
end
