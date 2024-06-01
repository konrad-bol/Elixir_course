defmodule SocketGallowsWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "hangman:*", SocketGallowsWeb.HangmanChannel

  # Called when the client attempts to connect to the socket.
  def connect(params, socket, _connect_info) do
    {:ok, assign(socket, :user_id, params["user_id"])}
  end

  # Identifies all sockets for a given user
  def id(socket), do: "users_socket:#{socket.assigns.user_id}"
end
