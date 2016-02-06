defmodule HelloPhoenix.MovieController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, movies: []
  end
end
