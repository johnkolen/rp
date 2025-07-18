class User < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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

  def role_label
    "Role"
  end
  ROLES = {
    0 => "None",
    1 => "Admin",
    2 => "Support",
    1000 => "User"
  }

  ROLES.each do |id, label|
    define_method "#{label.downcase}?" do
      role_id == id
    end
    const_set "Role#{label}", id
  end

  def role_sym
    ROLES[role_id].downcase.to_sym
  end

  def role_str
    ROLES[role_id]
  end

  def role_options
    ROLES.map { |k, v| [ v, k ] }
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
