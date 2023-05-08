class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  load_and_authorize_resource


  # GET /movies or /movies.json
  def index
    if params[:start_date].present?
      start_date=params[:start_date]
      end_date=params[:end_date]
    end
    @movies=(if params[:start_date].present?
              Movie.filter_by_date(start_date,end_date).all
            elsif params[:search].present?
              @movies = Movie.where("name LIKE ?", "%#{params[:search]}%")
            else
              Movie.all
            end).paginate(page: params[:page], per_page: 15)
  end

  # GET /movies/1 or /movies/1.json
  def show
    @review=Review.new
    default_ratings = Hash[(1..5).reverse_each.map { |n| [n, 0] }]
    @ratings = default_ratings.merge @movie.ratings.group(:star).count
    @rating = current_user.ratings.find_by(movie_id: @movie.id) || Rating.new(movie: @movie)
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.js
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:name, :re_date)
    end
end
