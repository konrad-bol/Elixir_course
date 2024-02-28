defmodule Procs do
  def greeter(count, what_to_say) do
    receive do
      {:boom , reason}->
        exit(reason)
      {:add, n} ->
        greeter(count+n,what_to_say)
      :reset ->
        greeter(0,what_to_say)
      msg ->
        IO.puts "#{count}: #{what_to_say}: #{msg}"
        greeter(count,what_to_say)
    end

  end
end
