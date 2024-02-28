defmodule Fib do

  def run do
     Cache.start()
  end

  def geter(pid,n) do
    case Cache.get(pid, n) do
      nil -> res = geter(pid,n-1)+geter(pid,n-2)
      Cache.put(pid,n,res)
      res
      val->
        val
    end
  end

end
