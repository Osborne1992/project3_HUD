class TournamentUsersController < ApplicationController

  load_and_authorize_resource

  before_action :find_tournament

  def new
    @tournament_user = @tournament.tournament_users.build
  end

  def create
    @tournament_user = @tournament.tournament_users.build(tournament_user_params)
    if @tournament_user.save
      redirect_to @tournament_user.tournament
    else
      render 'new'
    end
  end

  def destroy
    tournament_user = @tournament.tournament_users.find(params[:id])
    tournament_user.destroy
    redirect_to(@tournament)
  end

  def find_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def tournament_user_params
    params.require(:tournament_user).permit(:user_id)
  end

end