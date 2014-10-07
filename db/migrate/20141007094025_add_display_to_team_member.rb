class AddDisplayToTeamMember < ActiveRecord::Migration
  def change
    add_column :team_members, :display, :boolean
  end
end
