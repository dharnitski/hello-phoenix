defmodule HelloPhoenix.ListingMoviesIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias HelloPhoenix.Router
  alias HelloPhoenix.Movie
  alias HelloPhoenix.Repo

  # plug Plug.Session,
  #   store: :cookie,
  #   key: "_hello_phoenix_key",
  #   signing_salt: "g6gvBOpH"

  @opts Router.init([])
  test 'listing movies' do
    # if you want to test session
    # opts = Plug.Session.init(store: :ets,
    #   key: "_my_app_session",
    #   secure: true,
    #   table: :session)

    %Movie{name: "Back to the future", rating: 5}
      |> Repo.insert!
    movies = Repo.all(Movie)
      |> Poison.encode!

    conn = conn(:get, "/api/movies")
    #  |> Plug.Session.call(opts)
    response = Router.call(conn, @opts)
    assert response.status == 200
    assert response.resp_body == movies
  end
end
