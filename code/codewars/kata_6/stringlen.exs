defmodule Longestconsec do

  def longest_consec(strarr, k) when strarr !== [] and k in 1..length(strarr) do
    strarr
    |> Enum.chunk_every(k,1,:discard)
    |> Enum.map(&Enum.join(&1))
    |> Enum.max_by(&String.length/1)
  end
  def longest_consec(_,_), do: ""
end
