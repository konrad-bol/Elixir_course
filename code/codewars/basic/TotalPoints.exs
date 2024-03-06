defmodule TotalPoints do
  def score(score) do
    (String.first(score) |> String.to_integer())-(String.last(score) |> String.to_integer())
    |>p()
  end

  def p(0), do: 1
  def p(x) when x > 0, do: 3
  def p(x) when x < 0, do: 0

  def points(games) do
    Enum.reduce(games,0, fn t,acc -> acc+ score(t) end)
  end
end
