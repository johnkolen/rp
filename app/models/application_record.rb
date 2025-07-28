class ApplicationRecord < ActiveRecord::Base
  include ObjectView::Record

  primary_abstract_class

  def self.dtparent
    nil
  end
end
