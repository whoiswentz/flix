class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    redirect_to @movie if @movie.update(update_params)
  end

  private
  def update_params
    params.require(:movie).permit(:title, :description, :total_gross, :released_at)
  end

end
