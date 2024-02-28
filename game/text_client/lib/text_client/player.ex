defmodule TextClient.Player do
  alias TextClient.{State, Summary, Prompter, Mover}

  def play(_game = %State{tally: %{game_state: :won}}) do
    exit_with_message("You won!")
  end
  def play(_game = %State{tally: %{game_state: :lost}}) do
    exit_with_message("Sorry, you lost")
  end

  def play(game = %State{tally: %{game_state: :good_guess}}) do
    continue_with_message(game,"good guess")

  end
  def play(game = %State{tally: %{game_state: :bad_guess}}) do
    continue_with_message(game,"Sorry, bad guess")
  end

  def play(game = %State{tally: %{game_state: :already_guessed}}) do
    continue_with_message(game,"you've already used that letter")
  end

  def play(game) do
    continue(game)
  end

  defp exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end
  defp continue_with_message(game, msg) do
    IO.puts(msg)
    continue(game)
  end

  def continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play()
  end

  def prompt(game) do
    game
  end
  def make_move(game) do
    game
  end
end
