defmodule Demo do
  def reverse do
    receive do
     {from_pid,msg} ->
        IO.inspect(from_pid)
        IO.puts(msg)
        result = msg |> String.reverse()
        send(from_pid,result)
        reverse()
    end
  end
end
