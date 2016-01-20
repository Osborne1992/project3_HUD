class TournamentsController < ApplicationController

  load_and_authorize_resource

    def index
      @tournaments = Tournament.all.order(:name)
    end

    def show
      @tournament = find_tournament
    end

    def new
      @tournament = current_user.tournaments.new
    end

    def create
      tournament = current_user.created_tournaments.create(tournament_params)
      redirect_to( tournament_path( tournament.id ) )
    end

    def destroy
      tournament = find_tournament
      tournament.destroy
      redirect_to(tournaments_path)
    end

    def edit
      @tournament = find_tournament
    end

    def update
      tournament = find_tournament
      tournament.update(tournament_params)
      redirect_to(tournament_path(tournament.id))
    end

    private

    def find_tournament
      Tournament.find(params[:id])
    end

    def tournament_params
      params.require(:tournament).permit(:name, :host, :creator_id, :start_date, :start_time, :end_date, :end_time, :description, :private, :location, :game_id, :platform_id, :first_prize, :second_prie, :third_prize)
    end

end