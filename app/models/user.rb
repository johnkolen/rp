class User < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams
  include StaticDims

  has_one :person, inverse_of: :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :set_default_role

  def password_label
    "Password"
  end

  def password_str
    password
  end

  def password_pattern
    nil
  end

  def password_confirmation_label
    "Password Confirmation"
  end

  def password_confirmation_str
    password_confirmation
  end

  def password_confirmation_pattern
    nil
  end

  def remember_me_label
    "Remember me"
  end

  static_dim :role,
             0 => "None",
             1 => "Admin",
             2 => "Support",
             1000 => "User"

  def set_default_role
    self.role_id = RoleUser if self.role_id == 0
  end

  def is_self?(obj)
    return true if self.id == obj.id && obj.class == self.class
    return false unless person_id
    return person_id == obj.id if obj.is_a? Person
    return person_id == obj.person_id if obj.respond_to? :person_id
    # TODO: obj might have person deeper than first level
    false
  end
end
