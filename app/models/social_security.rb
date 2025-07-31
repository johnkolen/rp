class SocialSecurity < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  include Incomeable
  include SimpleInterest
  
    validates :benefit_at_62, comparison: { greater_than_or_equal_to: 0 }
    
    validates :benefit_at_67, comparison: { greater_than_or_equal_to: 0 }
    
    validates :benefit_at_70, comparison: { greater_than_or_equal_to: 0 }
    
    
end
