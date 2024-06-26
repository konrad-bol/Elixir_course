# lib/socket_gallows_web/channels/room_channel.ex
defmodule SocketGallowsWeb.HangmanChannel do
  use Phoenix.Channel

  def join("hangman:game" , _params, socket) do
    game = Hangman.new_game()
    socket = assign(socket, :game, game)
    {:ok, socket}
  end

  def handle_in("tally", _, socket) do
   game = socket.assigns.game
   tally = Hangman.tally(game)
   push(socket,"tally", tally)
    {:noreply, socket}
  end
end
