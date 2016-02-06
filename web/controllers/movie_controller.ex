defmodule HelloPhoenix.MovieController do
  use HelloPhoenix.Web, :controller
  alias HelloPhoenix.Movie

  def index(conn, _params) do
    movies = Repo.all(Movie)
    render conn, movies: movies
  end
end
