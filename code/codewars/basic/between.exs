defmodule Kata do
  def between(a,b) do
    {:ok,pid}=start()
    b(a,b,pid)
  end

  defp b(a,b,pid) do
    case b-a do
      x when x>=0 -> put(pid,b)
      b(a,b-1,pid)

      _-> get(pid)
    end
  end

  defp start, do: Agent.start_link(fn ->[] end)
  defp put(pid,x), do: Agent.update(pid,&[x|&1])
  defp get(pid), do: Agent.get(pid,&(&1))

end
