defmodule GallowsWeb.HangmanController do
  use GallowsWeb, :controller
  def new_game(conn, _params) do
    render(conn, :new_game, layout: false)
  end

  def  index(conn,_params)do
    my_assign=[layout: { GallowsWeb.Layouts, :app}, number: 0, form: Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"),met: "put"]
    conn
    |>render(:index, my_assign)
  end

  def lookup(_conn, params) do
    raise inspect(params)
  end

  def make_move(conn,parms) do
    guess=parms["make_move"]["guess"]
    game=get_session(conn,:game)
    tally=Hangman.make_move(game,guess)
    my_assign=[tally: tally,layout: { GallowsWeb.Layouts, :app}, number: 0, form: Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move",method: :put)]
    conn|> render( :game_field ,my_assign)
  end

  def create_game(conn,_params) do
    game=Hangman.new_game()
    tally = Hangman.tally(game)
    my_assign=[tally: tally, number: 0, form: Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move",method: :put)]
    conn
    |>put_session(:game, game)
    |>render( :game_field, my_assign)
  end

end
