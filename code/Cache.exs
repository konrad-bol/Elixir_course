defmodule Cache do

  def start do
    Agent.start_link(fn ->%{0=>0,1=>1} end)
  end

  def put(pid,n,resoult) do
    Agent.update(pid,&Map.put(&1,n,resoult))
  end

  def get(pid,n) do
    Agent.get(pid,&(Map.get(&1, n)))
  end
end
