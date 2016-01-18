class GamesController < ApplicationController

  def index
    @games = Game.all.order(:name)
  end

  def show
    @game = find_game
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.create(game_params)
    redirect_to( game_path( game.id ) )
  end

  def destroy
    game = find_game
    game.destroy
    redirect_to(games_path)
  end

  def edit
    @game = find_game
  end

  def update
    game = find_game
    game.update(game_params)
    redirect_to(game_path(game.id))
  end

  private

  def find_game
    Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :developer, :publisher, :release_date)
  end

end