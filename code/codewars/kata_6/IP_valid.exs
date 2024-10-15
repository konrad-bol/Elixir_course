defmodule Solution do
  def is_valid_ip(ip) do
    ip
    |>String.split(".")
    |>Enum.map(&(valid_number(String.starts_with?(&1,"0"),Integer.parse(&1))))
    |>case  do
       [true,true,true,true]-> true
        _ -> false
    end
  end
  def valid_number(false,{num,""})when num<256, do: true
  def valid_number(_,_), do: false

end
