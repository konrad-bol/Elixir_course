defmodule Printererror do
  def printer_error(s) do
   String.replace(s,~r/[a-m]/,"")
    |> String.length()
    |> (&("#{&1}/#{String.length(s)}")).()
  end
end
