class UserRoleMap < ActiveRecord::Base

  belongs_to :user, :class_name => "User"
  belongs_to :role, :class_name => "Role"

  # attr_accessible :title, :body
end
