defmodule Math do
  def square?(n) when n<0 do
  false
  end
  def square?(n) do
    sq = Float.pow(n/1,1/2)
   sq == sq |>trunc()
  end
end
