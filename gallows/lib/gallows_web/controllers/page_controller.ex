defmodule GallowsWeb.PageController do
  use GallowsWeb, :controller

  def home(conn, _params) do

    # The home page is often custom made,
    # so skip the default app layout.
    conn
    |> put_flash(:ok, "HI")
    |> render( :home, layout: false, word: "map",count: 3)
  end
end
