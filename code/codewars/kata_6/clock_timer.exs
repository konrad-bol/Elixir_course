defmodule HumanReadable do
  def format(seconds) do
    [floor(seconds/3600),floor(rem(seconds,3600)/60),rem(seconds,60)]
    |>Enum.map(&(if &1<10 do
      "0"<>Integer.to_string(&1)
    else
      Integer.to_string(&1)
    end))
    |>Enum.join(":")
  end
end
