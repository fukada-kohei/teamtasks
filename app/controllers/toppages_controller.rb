class ToppagesController < ApplicationController
  def index
    if logged_in?
      @teams = current_user.joined_teams
    end
  end
end
