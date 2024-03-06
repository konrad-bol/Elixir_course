defmodule KeepHydrated do
  def litres(time) do
    time |>floor() |> div(2)|>floor()
  end
end
