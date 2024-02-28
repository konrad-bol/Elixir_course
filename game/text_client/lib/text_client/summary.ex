defmodule TextClient.Summary do
  def display(game = %{tally: tally}) do
    IO.puts [
      "\n",
      "Word so far: #{Enum.join(tally.letters, " ")}\n",
      "guesses left: #{tally.turn_left}\n",
    ]
    game
  end
end
