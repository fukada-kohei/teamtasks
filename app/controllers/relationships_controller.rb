class RelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    team = Team.find(params[:team_id])
    current_user.join(team)
    flash[:success]='チームに参加しました'
    redirect_to team
  end

  def destroy
    team = Team.find(params[:team_id])
    current_user.unjoin(team)
    flash[:success]='チームから脱退しました'
    redirect_to teams_path
  end
end
