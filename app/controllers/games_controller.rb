class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy reviews info]

  def index
    @games = Game.all
  end

  def show
  end

  def edit
  end

  def update
    if @game.update!(params_game)
      redirect_to games_path
    else
      render :edit
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params_game)
    @game.user = current_user
    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  def listed
    # TODO: List of games offered by users. Options for rankings and sorting and stats regardless of availability.
    # @games = Game.where()
  end

  def published
    # TODO: Find games in a Database DB and show which games are already in the database
  end

  def reviews
    # TODO: show all reviews for this game
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def params_game
    params.require(:game).permit(:title, :price_per_day, :description, :genre_id, :console_id, :image)
  end
end
