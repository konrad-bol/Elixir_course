defmodule SumMix do
  def sumMin(list) do
    list
    |> Enum.map(fn x-> if is_binary(x),do: String.to_integer(x), else: x end )
    |> Enum.sum()
end
end
