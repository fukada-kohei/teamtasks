class TeamsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @team = Team.new
    @teams = Team.order(id: :desc).page(params[:page])
  end

  def show
    @team = Team.find(params[:id])
    @tasks = @team.tasks.order(id: :desc).page(params[:page])
    @task = Task.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success]='チームを作成しました'
      redirect_to @team
    else
      flash.now[:danger]='チームの作成に失敗しました'
      render :index
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    
    if @team.update(team_params)
      flash[:success]= 'Teamは正常に更新されました'
      redirect_to @team
    else
      flash.now[:danger]= 'Teamは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    
    flash[:success]= 'Teamは削除しました'
    redirect_to teams_url
  end
  
  def members
    @team = Team.find(params[:id])
    @members = @team.members.page(params[:page])
    @task = Task.new
  end  
  
  private
  
  def team_params
    params.require(:team).permit(:team_name)
  end
  
end
