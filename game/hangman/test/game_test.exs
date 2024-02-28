defmodule GameTest do
  use ExUnit.Case
  alias Hangman.Game
  test "new_game returns structure" do
    game = Game.new_game()
    assert game.turn_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
    assert 12>1
  end

  test "state isn't change for :won or lost" do
    for state <- [:lost, :won] do
      game = Game.new_game() |> Map.put(:game_state, state)
      assert ^{game, _t} = Game.make_move(game, "x")
    end
  end


  test "first occurent of letter isn't already used" do
    {game, _tally} = Game.new_game()
    {game, _tally} = Game.make_move(game,"x")
    assert game.game_state != :already_guessed
  end

  test "second occurent of letter isn't already used" do
    game = Game.new_game()
    {game, _tally} = Game.make_move(game,"x")
    {game, _tally} = Game.make_move(game,"x")
    assert game.game_state == :already_guessed
  end

  test  "a good guess is recognized" do
    game = Game.new_game("pies")
    {game, _tally} = Game.make_move(game,"s")
    assert game.game_state == :good_guess
    assert game.turn_left == 7
  end

  test  "a guess word is a won game" do
    game = Game.new_game("pies")
    {game, _tally} = Game.make_move(game,"p")
    assert game.game_state == :good_guess
    assert game.turn_left == 7
    {game, _tally} = Game.make_move(game,"i")
    assert game.game_state == :good_guess
    assert game.turn_left == 7
    {game, _tally} = Game.make_move(game,"e")
    assert game.game_state == :good_guess
    assert game.turn_left == 7
    {game, _tally} = Game.make_move(game,"s")
    assert game.game_state == :won
    assert game.turn_left == 7
   end

    test  "a guess word is a won game but different" do
      moves = [ {"w", :good_guess},
       {"i", :good_guess},
       {"b", :good_guess},
       {"l", :good_guess},
       {"e", :won} ]
       game = Game.new_game("wibble")

        Enum.reduce(moves, game, fn x, game ->
        {game, _tally} = Game.make_move(game,elem(x,0))
         assert game.game_state == elem(x,1)
         game

        end)
     end

     test "bad guess is recognize"do
      game = Game.new_game("pies")
      {game, _tally}= Game.make_move(game,"x")
      assert game.turn_left == 6
      assert game.game_state == :bad_guess
     end

     test "lose game is recognize"do
      game = Game.new_game("x")
      moves = [
        {"a", :bad_guess},
        {"b", :bad_guess},
        {"c", :bad_guess},
        {"d", :bad_guess},
        {"f", :bad_guess},
        {"g", :bad_guess},
        {"h", :lose},
      ]
      |> Enum.with_index(1)
      |> Enum.reduce( game, fn x, game ->
        {game, _tally} = Game.make_move(game,elem(x,0))
        assert game.game_state == elem(x,0) |> elem(1)
        assert game.turn_left == 7 - elem(x,1)
        game
      end)

     end
end
