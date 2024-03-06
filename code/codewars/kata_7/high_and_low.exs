defmodule Kata do
  def high_and_low(s) do
      s|> String.split(" ")
      |> Enum.map(&String.to_integer(&1))
      |> Enum.min_max()
      |> Tuple.to_list()
      |> Enum.reverse()
      |> Enum.join(" ")
  end
end
