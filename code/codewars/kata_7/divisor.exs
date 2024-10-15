defmodule Kata do
  def divisors(n) do
    2..n+1
    |>Enum.reduce_while({1,n},fn divider, {acc,num} ->
      IO.inspect({acc,num})
      cond do
        num==1 ->{:halt,acc}
        rem(num,divider) == 0 ->{:cont,{elem(div(num,divider,0),0)*acc,elem(div(num,divider,0),1)}}
        true -> {:cont,{acc,num}}

      end
    end)
  end
  def div_prime(divider,number), do: div( number,divider,0)


  def div(number,divider, ans) do
    if(rem(number,divider)==0) do
      div(div(number,divider) , divider, ans+1)
    else
      {ans+1,number}
    end
  end
end
