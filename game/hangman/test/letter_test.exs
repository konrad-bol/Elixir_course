defmodule LetterTest do
  use ExUnit.Case
  alias Hangman.Game
  test "letter check" do
    string = Game.new_game.letters
    assert Enum.all?(string, fn x -> Base.encode16(x)>="61" && :binary.first(x)<= 122  end)
  end
end
