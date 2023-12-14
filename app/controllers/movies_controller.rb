class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    @movie.save
    redirect_to @movie
  end

  def index
    @movies = Movie.released
  end

  def show; end

  def edit; end

  def update
    @movie.update(movie_params)
    redirect_to @movie
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, status: :see_other
  end

  private

  def movie_params
    params
      .require(:movie)
      .permit(
        :title, :rating, :description,
        :released_on, :total_gross, :director,
        :duration, :image_file_name)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
