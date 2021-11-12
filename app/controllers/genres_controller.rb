class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params_genre)
    if @genre.save
      # flash[:success] = "Object successfully created"
      redirect_to genres_path
    else
      # flash[:error] = "Something went wrong"
      @genres = Genre.all
      render :index
    end
  end

  private

  def params_genre
    params.require(:genre).permit(:name, :image)
  end
end
