defmodule Kata do
  def latest_clock(a, b, c, d) do
     {hours,minutes}=
      [a,b,c,d]
     |>get_perm_list()
     |>Enum.map( fn [x,y,a,b] -> {10*x+y,10*a+b} end)
     |>Enum.reject(fn {x,y}-> x>=24 || y>=60 end)
     |>Enum.sort(&(elem(&1,1)>=elem(&2,1)))
     |> Enum.max_by(&elem(&1,0))
     Time.from_erl!({hours, minutes,0})
     |> Time.to_string()
     |> String.slice(0,5)
  end

def get_perm_list(list) do
  get_perm_list(list,[get_unique(list)])
end

  def get_perm_list(list,perm_list) do
    perm=check_perm(list)
    perm_list=[get_unique(list)|perm_list]
    |> Enum.uniq()
    case length(perm_list) do
      x when x<perm->get_perm_list(list,perm_list)
      _-> perm_list
   end
  end
  def check_perm(list) do
    list_of_uniq=list|>Enum.uniq()
    rep=Enum.map(list_of_uniq, fn x -> number_of_member(list,x) end)
    |>Enum.filter(&(&1!=1))
    case rep do
       []->24
       _->24/Enum.reduce(rep,0,fn x,acc -> acc+fact(x)end)
    end
  end

  def number_of_member(list,member), do: Enum.reduce(list,0, fn x, acc -> if x==member do acc+1 else acc end end )
  def fact(0), do: 1
  def fact(1), do: 1
  def fact(x), do: x*fact(x-1)


  def get_unique(list) do
    uniq1=Enum.random(list)

    list=List.delete(list,uniq1)
    uniq2=Enum.random(list)

    list=List.delete(list,uniq2)
    uniq3=Enum.random(list)

    list=List.delete(list,uniq3)
    uniq4=Enum.random(list)
    [uniq1,uniq2,uniq3,uniq4]

  end

end
