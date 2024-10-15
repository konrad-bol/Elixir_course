defmodule WeightSort do
  def weight(str) do
    str
    |> String.split()
    |> Enum.sort(&sorter(&1, &2))
    |> Enum.join(" ")
  end

  def sum_of_number(x) do
    String.graphemes(x)
    |> Enum.reduce(0, &(&2 + String.to_integer(&1)))
  end

  def sorter(s1, s2) do
    cond do
      sum_of_number(s1) == sum_of_number(s2) -> s1 < s2
      true -> sum_of_number(s1) < sum_of_number(s2)
    end
  end
end
