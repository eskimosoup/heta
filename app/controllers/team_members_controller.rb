class TeamMembersController < ApplicationController

  before_filter :team_members

  def index
    @team_members = TeamMember.order(:position).where(display: true)
  end

  def show
    @team_member = TeamMember.where(display: true).find(params[:id])
    @current_team_member = @team_member
    @title = "#{@title} - #{@team_member.name}" unless @team_member.blank?
  end

  private
    def team_members
      @title = "Management Team"
      @team_members = TeamMember.order(:position).where(display: true)
    end
end
