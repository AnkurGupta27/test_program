class Ability
  include CanCan::Ability

  def initialize(user)

    user ||=User.new #guest user
    roles=[]
    user.roles.each do |role|
      if (role.name == "admin")
        can [:manage], :all
      elsif(role.name == "user")
        can [:manage], :create_project
      end
    end
  end

end
