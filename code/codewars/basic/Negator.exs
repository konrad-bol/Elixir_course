defmodule Negator do
  def make_negative(num) do
      case num do
         num when num<0 -> -num
         _ -> num
      end
  end
end
