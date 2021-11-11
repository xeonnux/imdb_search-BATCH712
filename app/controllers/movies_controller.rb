class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # For only exact title search
      # @movies = Movie.where(title: params[:query])

      # For search within title (not exact: "super")
      # @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")

      # For title and synopsis
      # sql_query = "title ILIKE :query OR synopsis ILIKE :query"
      # @movies = Movie.where(sql_query, query: "%#{params[:query]}%")

      # Search through associations
      # sql_query = " \
      # movies.title ILIKE :query \
      # OR movies.synopsis ILIKE :query \
      # OR directors.first_name ILIKE :query \
      # OR directors.last_name ILIKE :query \
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      # Search multiple Terms
      # sql_query = " \
      # movies.title @@ :query \
      # OR movies.synopsis @@ :query \
      # OR directors.first_name @@ :query \
      # OR directors.last_name @@ :query \
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.all
    end
  end
end
