defmodule Grow do
  def grow(arr) do
    Enum.reduce(arr, 1, fn x,acc -> acc*x end)
  end
end
