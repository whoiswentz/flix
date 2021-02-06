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
    redirect_to @movie if @movie.update(movie_params)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    redirect_to @movie if @movie.save
  end

  def destroy
    @movie = Movie.find(params[:id])
    redirect_to movies_url if @movie.destroy
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :description, :total_gross, :released_at)
  end
end
