defmodule GallowsWeb.HangmanController do
  use GallowsWeb, :controller

  def new_game(conn, _params) do
    render(conn, :new_game, layout: false)
  end
  #def create_new_game(conn,_params) do

  #end
end
