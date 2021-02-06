class MoviesController < ApplicationController
  add_flash_types(:danger)

  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie successfully updated'
    else
      render :edit
    end

  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Movie successfully created'
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      redirect_to movies_url, notice: "Movie #{@movie.title} deleted"
    else
      redirect_to @movie
    end
  end

  private
  def movie_params
    params.require(:movie)
          .permit(:title, :description, :total_gross, :released_on, :director, :duration, :image_file_name, :rating)
  end
end
