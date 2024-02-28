defmodule TextClient.Prompter do

  def accept_move(game) do
    _input = IO.gets("Your guess: ")
    |> check_input(game)
  end

  defp check_input({:error, reason},_) do
    IO.puts("Game ended: #{reason}")
    exit(:normal)
  end
  defp check_input(:eof,_) do
    IO.puts("Looks like you gave up")
    exit(:normal)
  end

  defp check_input(input, game) do
    input = input |> to_string()
    input = String.trim(input)
    cond do
      input =~ ~r/\A[a-z]\z/ ->
        Map.put(game,:guess,input)
        true ->
          IO.puts("pleas entry a single lowercase letter")
          accept_move(game)

    end

  end
end
