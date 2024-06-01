defmodule SocketGallowsWeb.PageController do
  use SocketGallowsWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: {SocketGallowsWeb.Layouts, :app})
  end
end
