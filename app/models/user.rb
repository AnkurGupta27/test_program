class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :user_role_maps, :class_name => "UserRoleMap", :primary_key => :id, :foreign_key => "user_id"
  has_many :roles, :through => :user_role_maps

  has_many :problem_user_mappings, :class_name => "ProblemUserMapping", :primary_key => :id, :foreign_key => "user_id"


  def self.current_user= user
    Thread.current[:current_user] = user
  end

  def self.current_user
    Thread.current[:current_user]
  end


end
