defmodule Lists do

  def len([]), do: 0
  def len([_head|t]), do: 1 + len(t)

  def sum([]), do: 0
  def sum([h|t]), do: h+ sum(t)


  def double([]), do: []
  def double([h|t]), do:  [h*2|double(t)]

  def square([]), do: []
  def square([h|t]), do:  [h*h|square(t)]

  def sum_pairs([]), do: []
  def sum_pairs([h1,h2|t]) do

    if(rem(len([h1,h2|t]),2)==1) do
      "nie da sie sumowac"
    else
    [h1+h2|sum_pairs(t)]
    end

  end

end
