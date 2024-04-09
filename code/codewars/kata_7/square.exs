defmodule Kata do
  alias ElixirSense.Core.Struct
  def square_digits(n) do
      Integer.digits(n)
     |> Enum.map_join(&(&1*&1))
     |> String.to_integer()
  end
end
