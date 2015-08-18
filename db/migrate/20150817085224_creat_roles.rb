class CreatRoles < ActiveRecord::Migration
  def change
	Role.create(:name => "admin")
        Role.create(:name => "user")
  end
end
