defmodule Hangman.Game do

  defstruct(
    turn_left: 7,
    game_state: :initializing,
    letters: [],
    used: MapSet.new()
  )

  def new_game(word) do
    %Hangman.Game
    {
      letters: word |> String.codepoints
    }
  end
  def new_game() do
      new_game(Dictionary.random_word)
  end

  def make_move(game = %{ game_state: state }, _guess) when state in [:won, :lost] do
    game
    |> return_with_tally()
  end

  def make_move(game, guess)do
    guess= String.downcase(guess)
   accept_move(game, guess, MapSet.member?(game.used, guess))
   |> return_with_tally()
  end

  def tally(game) do
    %{
     game_state: game.game_state,
     turn_left: game.turn_left,
     letters: reveal_guessed(game.letters, game.used),
     used: game.used |> MapSet.to_list() |> Enum.sort()
     }
  end


  ####################################
  defp reveal_guessed(letters,used) do
     letters
    |> Enum.map( fn letter -> reveal_letter(letter, MapSet.member?(used, letter)) end)
  end
  defp reveal_letter(letter,_is_member? = true), do: letter
  defp reveal_letter(_letter,_is_member? ), do: "_"

  defp accept_move(game, _guess, _already_guessed = true) do
    Map.put(game, :game_state, :already_guessed)
  end
#  defp accept_move(game, guess, already_guessed,_is_small=false ) do
   # guess = String.downcase(guess)
  #  accept_move(game, guess , already_guessed, true)
 # end

  defp accept_move(game, guess, _already_guessed) do
    Map.put(game, :used, MapSet.put(game.used, guess))
    |> score_guess(Enum.member?(game.letters, guess))
  end

  defp score_guess(game, _good_guess = true) do
    new_state = MapSet.new(game.letters)
    |> MapSet.subset?( game.used)
    |> maybe_won()
    Map.put(game, :game_state, new_state)
  end

  defp score_guess(game = %{turn_left: 1}, _not_good_guess) do
    %{game |
      game_state: :lost,
      turn_left:  0
    }
  end

  defp score_guess(game = %{turn_left: turn_left}, _not_good_guess) do
    %{game |
      game_state: :bad_guess,
      turn_left: turn_left - 1
    }
  end

  defp maybe_won(true), do: :won
  defp maybe_won(_), do: :good_guess

  defp return_with_tally(game), do: {game, tally(game)}


end
