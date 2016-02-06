defmodule HelloPhoenix.MovieView do
  use HelloPhoenix.Web, :view

  def render("index.json", %{movies: movies}) do
    movies
  end
end
