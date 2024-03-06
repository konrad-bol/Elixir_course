defmodule Kata do
  def latest_clock(a, b, c, d) do
    list=%{a: a,b: b,c: c,d: d}
    #|>Enum.sort_by(&elem(&1,1))

    {key_bh,big_h}=list
    |>Enum.filter(&elem(&1,1)<=2 )
    |>Enum.max_by(&elem(&1,1))
    list=Map.reject(list,&(elem(&1,0)==key_bh))
    case big_h do
       2-> {key_sh,small_h}=list
       |>Enum.filter(&elem(&1,1)<=4)
       |>Enum.max_by(&elem(&1,1))
        _->{key_sh,small_h}=list
        |>Enum.filter(&elem(&1,1)<=4)
        |>Enum.max_by(&elem(&1,1))
    end
    {key_sh,small_h}=list
    |>Enum.filter(&elem(&1,1)<=2 )
    |>Enum.max_by(&elem(&1,1))
    list
  end
end
